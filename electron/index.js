const { app, BrowserWindow, session } = require('electron');

function createWindow() {
    const win = new BrowserWindow({
        width: 1750,
        height: 900,
        webPreferences: {
            nodeIntegration: true
        }
    });
    
    // let watchtower self-signed work
    session.defaultSession.setCertificateVerifyProc((request, callback) => {
        callback(0);
    });

    win.loadURL('http://wt.local')
	win.removeMenu();
}

app.whenReady().then(createWindow);
