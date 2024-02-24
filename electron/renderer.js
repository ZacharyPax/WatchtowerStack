// This code is broken. I guess I'm just stupid because everything indicates it should work.

const { shell } = require('electron');

document.addEventListener('DOMContentLoaded', () => {
    const homeButton = document.getElementById('homeButton');

    homeButton.addEventListener('click', () => {
        shell.openExternal('http://wt.local');
    });
});
