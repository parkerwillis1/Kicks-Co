// Fetch initial inventory data
fetch('/inventory')
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        const tableBody = document.querySelector('#inventory-table tbody');
        data.forEach(shoe => {
            const row = document.createElement('tr');
            const cell = document.createElement('td');
            cell.textContent = shoe.name;
            row.appendChild(cell);
            tableBody.appendChild(row);
        });
    })
    .catch(e => {
        console.log('There was a problem with the fetch operation: ' + e.message);
    });

// Add event listener for the "Add Shoe" button
document.querySelector('#add-shoe-button').addEventListener('click', () => {
    const shoeName = document.querySelector('#new-shoe-name').value;
    if (shoeName.trim() === '') {
        alert('Please enter a shoe name');
        return;
    }
    fetch('/inventory', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ name: shoeName }),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        // After the server responds, clear the input and reload the page
        document.querySelector('#new-shoe-name').value = '';
        location.reload();
    })
    .catch(e => {
        console.log('There was a problem with the fetch operation: ' + e.message);
    });
});
