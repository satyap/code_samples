(function ($) {
    window.bank = {
        elevators: [],
        num_elevators: 4,
        floors: 6,
        width: 40,
        height: 40,
        padding: 20,
        button_space: 30
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
                'background_color': '#f00',
            });
            this.draw_floors();
            this.draw_buttons();
        },
        draw_floors: function() {
            var $bank = $('#bank');
            for(var i=0;i <= bank.floors; i++) {
                var $floor = $('<div class="floor"/>');
                $floor.css({
                    width: $bank.css('width'),
                    height: bank.height,
                    top: i * bank.height,
                });
                $bank.append($floor);
            }
        },
        draw_buttons: function() {
            var $bank = $('#bank');
            for(var i=0;i <= bank.floors; i++) {
                var $up = $('<div class="up button"/>');
                var $down = $('<div class="down button"/>');
                $up.css({
                    width: 5,
                    height: 5,
                    top: i * bank.height + 15,
                });
                $down.css({
                    width: 5,
                    height: 5,
                    top: i * bank.height + 25,
                });
                $bank.append($up);
                $bank.append($down);
            }
        }
    });

    $(document).ready((new bank.Controller).start);

})(jQuery);
