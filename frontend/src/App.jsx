import React, { useState, useEffect } from 'react';
import axios from 'axios';

const api = axios.create({ baseURL: '/api' });

function App() {
  const [health, setHealth] = useState(null);
  const [token, setToken] = useState(localStorage.getItem('token'));
  const [user, setUser] = useState(null);
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  useEffect(() => {
    api.get('/health').then((r) => setHealth(r.data));
    if (token) {
      api.get('/auth/me', { headers: { Authorization: `Bearer ${token}` } })
        .then((r) => setUser(r.data))
        .catch(() => { localStorage.removeItem('token'); setToken(null); });
    }
  }, [token]);

  const handleLogin = async () => {
    try {
      const r = await api.post('/auth/login', { username, password });
      localStorage.setItem('token', r.data.access_token);
      setToken(r.data.access_token);
    } catch (e) {
      alert('Login failed');
    }
  };

  const handleLogout = () => {
    localStorage.removeItem('token');
    setToken(null);
    setUser(null);
  };

  return (
    <div style={{ fontFamily: 'system-ui, sans-serif', padding: '2rem', maxWidth: 600, margin: '0 auto' }}>
      <h1>GHR-STEAM</h1>
      <p>API Status: {health?.status ?? 'loading...'} {health?.version && `(v${health.version})`}</p>
      <hr />
      {!token ? (
        <div>
          <h2>Login</h2>
          <input placeholder="Username" value={username} onChange={(e) => setUsername(e.target.value)} /><br />
          <input placeholder="Password" type="password" value={password} onChange={(e) => setPassword(e.target.value)} /><br />
          <button onClick={handleLogin}>Login</button>
        </div>
      ) : (
        <div>
          <h2>Welcome {user?.username ?? '...'}</h2>
          <button onClick={handleLogout}>Logout</button>
        </div>
      )}
    </div>
  );
}

export default App;
