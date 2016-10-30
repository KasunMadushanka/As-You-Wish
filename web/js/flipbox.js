(function () {
    var cards = document.querySelectorAll(".card.effect__click");
    for (var i = 0, len = cards.length; i < len; i++) {
        var card = cards[i];
        clickListener(card);
    }

    function clickListener(card) {
        card.addEventListener("click", function () {

            var c = this.classList;
            
            if (!c.contains("flipped")) {
                c.add("flipped");
            }

        });
    }
})();
