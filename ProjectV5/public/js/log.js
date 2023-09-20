const error = document.getElementById('error');
const uName = document.getElementById('uName');
const uPass = document.getElementById('pWord');

const log = document.getElementById('logBtn');

uName.onfocus = resetErr;
uPass.onfocus = resetErr;

log.onclick = () => {
    fetch('/logdat')
        .then(response => {
            if (!response.ok) {
                throw new Error("Network error response was not ok");
            }
            return response.json();
        })
        .then(data => {
            data.forEach(log => {
                if (uName.value == log.ST_Email && uPass.value == log.ST_Password) {
                    console.log("LOGGED IN");
                    location.href='/dashboard';
                } else {
                    logErr();
                }
            });
        })
        .catch(error => {
            console.error("There was a problem with fetching login data:", error);
        })
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

