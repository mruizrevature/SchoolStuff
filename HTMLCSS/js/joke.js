function getJoke() {
    // Create XMLHttpRequest object
    var xhr = new XMLHttpRequest();

    // onreadystatechange - An event handler for an event that fires at
    //          every state change.
    // Ready States:
    //      0 - The request has not been initialzied
    //      1 - The request has been setup
    //      2 - The request has been sent
    //      3 - The request is in process
    //      4 - The request is complete
    xhr.onreadystatechange = function() {
        // HTTP Response status codes
        // 100 - Informational
        // 200 - Successful
        // 300 - Redirection
        // 400 - Client error
        // 500 - Server error
        if(xhr.readyState == 4 && xhr.status === 200) {
            var x = JSON.parse(xhr.response);
            console.log('x: ' + x);
            document.getElementById('jokeHolder').innerText = x.value.joke;
        }
    };

    // Open HttpRequest
    
    // GET or POST?
    // GET is simpler and faster than POST, and can be used in most cases.
    // However, always use POST requests when:
    //      - A cached file is not an option (update a file or server)
    //      - Sending large amount of data to server (POST has no size limitations.)
    //      - Sending user input (which can be unknown characters)
    //          POST is more robust and secure than GET

    // Specify method, URL, and other optional attributes of a request.
    xhr.open('GET','http://api.icndb.com/jokes/random');
    // Send the request
    xhr.send();
    
}

function clearJoke() {
    document.getElementById('jokeHolder').innerText = '';
}










