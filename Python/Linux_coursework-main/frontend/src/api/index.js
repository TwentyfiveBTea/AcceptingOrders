import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'http://localhost:8000/',
  withCredentials: false,
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json'
  }
});

export default {
  getData() {
    return apiClient.get('api_home');
  }
}