const error = document.getElementById('error');
const uName = document.getElementById('uName');
const uPass = document.getElementById('pWord');

const log = document.getElementById('logBtn');
const reg = document.getElementById('regBtn');

//REPLACE WITH DB USER DATA
const userN = 'admin';
const userP = 'utsautsa';

uName.onfocus = resetErr;
uPass.onfocus = resetErr;

log.onclick = () => {
    if (uName.value == userN && uPass.value == userP) {
        console.log("LOGGED IN"); 
        window.open("dash.html", "_self");
    }
    else {
        logErr();
    }
}

// REMOVE ONCE IMPLEMENTED
reg.onclick = () => {
    alert("Not Yet Implemented");
}

function resetErr() {
    error.innerText = '';
    uName.className = 'userInput';
    uPass.className = 'userInput';
}

function logErr() {
    error.innerText = 'Invalid username or password!';
    uName.className = 'inputErr';
    uPass.className = 'inputErr';
}

