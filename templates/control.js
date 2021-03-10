var accessToken = null;

var signIn = new OktaSignIn({
    baseUrl: '{{okta_domain}}',
    clientId: '{{okta_client_id}}',
    redirectUri: window.location.origin,
    authParams: {
        issuer: '{{okta_issuer_uri}}',
        responseType: ['token', 'id_token']
    }
});

signIn.renderEl({
    el: '#widget-container'
}, function success(res) {
    if (res.status === 'SUCCESS') {
        accessToken = res.tokens.accessToken.accessToken;
        signIn.hide();
        loaddetails()
    } else {
        alert('fail);')
    }
}, function(error) {
    alert('error ' + error);
});

function loaddetails() {
    const url = "https://{{okta_domain}}/api/v1";
    var headers = {
        'Accept': 'application/json',
        'Authorization': 'SSWS {{api_token}}',
        'Content-Type': 'application/json'
    }

    fetch(url, {
        method : "GET",
        mode: 'cors',
        headers: headers
    })
    .then((response) => {
        if (!response.ok) {
            throw new Error(response.json())
        }
        return response.json();
    })
    .then(data => {
        document.getElementById('details').value = data.messages.join('\n');
    })
    .catch(function(error) {
        document.getElementById('details').value = error;
    });
}
