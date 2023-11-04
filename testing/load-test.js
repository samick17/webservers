import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
  // Key configurations for avg load test in this section
  stages: [
    { duration: '10s', target: 200 }, // traffic ramp-up from 1 to 100 users over 5 minutes.
    { duration: '10s', target: 200 }, // stay at 100 users for 10 minutes
    { duration: '10s', target: 0 }, // ramp-down to 0 users
  ],
};

export default () => {
  const urlRes = http.post('http://localhost:3000/api/v1/test', '{}', {
    headers: {
      'Content-Type': 'application/json',
    },
  });
};
