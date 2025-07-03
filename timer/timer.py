import curses
import time
from datetime import datetime, timedelta

SCALES = [
    ('minute', timedelta(minutes=1)),
    ('10 minutes', timedelta(minutes=10)),
    ('30 minutes', timedelta(minutes=30)),
    ('hour', timedelta(hours=1)),
    ('day', timedelta(days=1))
]


def human_readable(td: timedelta):
    seconds = int(td.total_seconds())
    abs_seconds = abs(seconds)

    if abs_seconds >= 86400 * 30:
        value = seconds // 86400 // 30
        unit = "week"
    if abs_seconds >= 86400:
        value = seconds // 86400
        unit = "day"
    elif abs_seconds >= 3600:
        value = seconds // 3600
        unit = "hour"
    elif abs_seconds >= 60:
        value = seconds // 60
        unit = "minute"
    else:
        value = seconds
        unit = "second"

    return f"{value} {unit}{'s' if abs(value) != 1 else ''}"


def compute_time_blocks(start_time, end_time, step):
    blocks = []
    t = start_time
    while t < end_time:
        blocks.append(t)
        t += step
    blocks.append(end_time)
    return blocks


def get_filled_cells(time_blocks, now):
    return [time_blocks[i + 1] if now >= time_blocks[i + 1] else False for i in range(len(time_blocks) - 1)]


def draw_grid(stdscr, filled_cells, rows, cols):
    for i in range(rows):
        for j in range(cols):
            idx = i * cols + j
            if idx >= len(filled_cells):
                return
            ch = '█' if filled_cells[idx] else f'{str(j)[-1]}'
            ch = str(filled_cells[idx].strftime("%d"))[-1] if filled_cells[idx] else '.'
            try:
                stdscr.addch(i, j, ch)
            except curses.error:
                pass


def draw_clock_info(stdscr, start_time, end_time, now, y_offset, scale_name):
    try:
        pct = (now - start_time) * 100 // (end_time - start_time)
        left = human_readable(end_time - now)
        done = human_readable(now - start_time)
        total = human_readable(end_time - start_time)
        stdscr.addstr(y_offset, 0, f"Start: {start_time.strftime('%Y/%m/%d %H:%M:%S')} / {done} done")
        stdscr.addstr(y_offset + 1, 0, f"End:   {end_time.strftime('%Y/%m/%d %H:%M:%S')} / {left} left")
        stdscr.addstr(y_offset + 2, 0, f"Now:   {now.strftime('%Y/%m/%d %H:%M:%S')} / {pct}% / {total} total")
        stdscr.addstr(y_offset + 3, 0, f"Scale: 1 block per {scale_name}")
    except curses.error:
        pass


def determine_best_scale(start_time, end_time, max_cells):
    total_seconds = (end_time - start_time).total_seconds()
    for name, step in SCALES:
        needed_cells = int(total_seconds // step.total_seconds())
        if needed_cells <= max_cells:
            return name, step, needed_cells
    # fallback to the largest scale
    return SCALES[-1][0], SCALES[-1][1], int(total_seconds // SCALES[-1][1].total_seconds())


def update_screen(stdscr, start_time, end_time):
    curses.curs_set(0)
    stdscr.nodelay(True)

    while True:
        stdscr.clear()
        max_y, max_x = stdscr.getmaxyx()

        # Reserve lines for info
        info_lines = 4
        rows = max_y - info_lines
        cols = max_x
        total_cells = rows * cols

        now = datetime.now()
        scale_name, step, _ = determine_best_scale(start_time, end_time, total_cells)

        time_blocks = compute_time_blocks(start_time, end_time, step)
        filled_cells = get_filled_cells(time_blocks, now)

        draw_grid(stdscr, filled_cells, rows, cols)
        draw_clock_info(stdscr, start_time, end_time, now, rows, scale_name)

        stdscr.refresh()
        time.sleep(1)


def main():
    start_time = datetime(2025, 5, 31, 18, 0, 0)
    end_time = datetime(2025, 6, 25, 18, 0, 0)
    # end_time = start_time + timedelta(hours=9)  # Total time range to visualize
    curses.wrapper(update_screen, start_time, end_time)


if __name__ == "__main__":
    main()
