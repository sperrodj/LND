window.onload = () => {
    detectColor();
}

const colors = ['yellow', 'violet', 'pink', 'aquamarine', 'brown', 'lightgrey'];

function detectColor() {
    var buttons = document.querySelectorAll('#container div');
    for (var i = 0; i < buttons.length; i++) {
        var button = buttons[i];
        button.addEventListener('click', function() {
            changeColor(this);
            //changeBgColor(this.id);
        })
    }
}

function changeBgColor(color) {
    document.getElementsByTagName('body')[0].style.backgroundColor = color;
}

function changeColor(cell) {
    cell.style.backgroundColor = colors[Math.floor(Math.random()*colors.length)]
}