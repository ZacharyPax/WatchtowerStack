const { shell } = require('electron');

document.addEventListener('DOMContentLoaded', () => {
    const homeButton = document.getElementById('homeButton');

    homeButton.addEventListener('click', () => {
        shell.openExternal('http://wt.local');
    });
});