/**
 * Ejemplo de prueba de carga con k6
 * 
 * Para ejecutar:
 * k6 run performance/k6/example-load-test.js
 * 
 * Con InfluxDB:
 * k6 run performance/k6/example-load-test.js --out influxdb=http://localhost:8086/k6
 */

import http from 'k6/http';
import { check, sleep, group } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 20 },  // Ramp-up
    { duration: '1m30s', target: 20 }, // Hold
    { duration: '30s', target: 0 },   // Ramp-down
  ],
  thresholds: {
    // 95% de requests deben ser menores a 500ms
    http_req_duration: ['p(95)<500'],
    // Menos de 1% de requests pueden fallar
    http_req_failed: ['rate<0.01'],
  },
};

const BASE_URL = __ENV.API_URL || 'http://localhost:8000';

export default function () {
  group('API Load Test', () => {
    // Ejemplo 1: GET request
    let response = http.get(`${BASE_URL}/api/health`, {
      headers: {
        'Content-Type': 'application/json',
      },
    });

    check(response, {
      'status is 200': (r) => r.status === 200,
      'response time < 500ms': (r) => r.timings.duration < 500,
    });

    sleep(1);

    // Ejemplo 2: POST request
    const payload = JSON.stringify({
      name: 'Test User',
      email: 'test@example.com',
    });

    response = http.post(`${BASE_URL}/api/users`, payload, {
      headers: {
        'Content-Type': 'application/json',
      },
    });

    check(response, {
      'POST status is 201': (r) => r.status === 201,
      'POST response time < 1s': (r) => r.timings.duration < 1000,
    });

    sleep(2);
  });
}

/**
 * Hooks personalizados (opcional)
 */
export function setup() {
  console.log('Setup: Preparando pruebas de carga');
}

export function teardown() {
  console.log('Teardown: Finalizando pruebas de carga');
}
