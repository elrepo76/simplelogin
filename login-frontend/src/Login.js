import React, { Fragment, useState } from 'react';
//import axios from 'axios';

function Login() {
    const [username, setUserName] = useState('');
    const [password, setPassword] = useState('');

    const handleUserNameChange = (value) => {
        setUserName(value);
    };

    const handlePasswordChange = (value) => {
        setPassword(value);
    };

    const handleLogin = () => {
        const userlogin = {
            Username : username,
            Password : password
        }

        const url = 'https://localhost:44342/api/Login/Login';

        const req = {
            method: 'POST',
            mode: 'cors',
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(userlogin)
        };
        
        const getRequest = new Request(url, req);       
        
        fetch(getRequest)
        .then(response => response.text())
        .then(data => alert(data))
        .catch(error => alert(error))               
        
        /*
        axios.post(url, JSON.stringify(userlogin))
        .then((result) => {
            alert(result.data);
        }).catch((error) => {
            alert(error);
        })
        */
    }

    return(
        <Fragment>
        <div>Login</div>
        <label>Username: </label>
        <input type="text" id="txtUserName" placeholder='Enter Username' onChange={(e) => handleUserNameChange(e.target.value)} /><br></br>
        <label>  Password: </label>
        <input type="text" id="txtPassword" placeholder='Enter Password' onChange={(e) => handlePasswordChange(e.target.value)} /><br></br>
        <button onClick={() => handleLogin()}> Login </button>
        </Fragment>
    )
}

export default Login;