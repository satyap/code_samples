(function ($) {
    window.bank = {
        elevators: [],
        num_elevators: 4,
        floors: 6,
        width: 40,
        height: 40,
        padding: 20,
        button_space: 30,
        floors_called: {}
    };


    bank.Elevator = function(number) {
        this.xoffset = number * (bank.width + bank.padding) + bank.button_space;
        this.$el = $('<div class="elevator"/>');
        this.$el.css({
            width: bank.width,
            height: bank.height - bank.padding,
            'line-height': bank.height - bank.padding + 'px'
        });

        this.floor = number;
        this.moving = 0;

        _.bindAll(this, 'done_moving');

        $('#bank').append(this.$el);
    };

    _.extend(bank.Elevator.prototype, {
        goTo: function(floor) {
            this.moving = 1;
            this.floor = floor;
            this.draw();
        },

        done_moving: function() {
            this.$el.text(bank.floors - this.floor);
            this.moving = 0;
        },
        draw: function() {
            var self=this;
            this.$el.animate({
                left: this.xoffset,
                top: this.floor * bank.height + bank.padding
            }, {
                complete: this.done_moving,
                queue: true
            });
        }

    });

    bank.Controller = function() {
        _.bindAll(this, 'start');
    };
    _.extend(bank.Controller.prototype, {
        start: function() {
            for(var i=0; i < bank.num_elevators; i++) {
                var elevator = new bank.Elevator(i);
                elevator.goTo(elevator.floor);
                bank.elevators.push(elevator);
            }
            $('#bank').css({
                'width': bank.width * bank.elevators.length * bank.padding,
                'height': bank.floors * bank.height,
            });
            this.draw_floors();
            
        },
        draw_floors: function() {
            var $bank = $('#bank');
            for(var i=0;i <= bank.floors; i++) {
                var $floor = $('<div class="floor"/>');
                $floor.addClass('floor' + i);
                $floor.css({
                    width: $bank.css('width'),
                    height: bank.height,
                    top: i * bank.height,
                });
                this.draw_buttons(i, $floor);
                $bank.append($floor);
            }
        },
        draw_buttons: function(floor, $floor) {
            $floor.append( this.make_button(floor, 'up'));
            $floor.append( this.make_button(floor, 'down'));
        },
        make_button: function(floor, direction) {
            var $btn = $('<div class="button"/>');
            $btn.addClass(direction);
            var self=this;
            $btn.bind('click', function() { self.call_floor(floor, direction); });
            return $btn;
        },
        call_floor: function(floor, direction) {
            console.log("call:", floor, direction);
            $('.floor' + floor + ' .' + direction).addClass('pushed');
            bank.floors_called[direction + floor] = 1;
            console.log(bank.floors_called);
        }
    });

    $(document).ready((new bank.Controller).start);

})(jQuery);
