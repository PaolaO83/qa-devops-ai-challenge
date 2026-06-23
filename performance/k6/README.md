# Pruebas de Rendimiento con k6

Pruebas de carga modernas con k6.

## Instalación

### macOS
```bash
brew install k6
```

### Windows
```bash
choco install k6
```

### Linux
```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3232A
echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6-stable.list
sudo apt-get update
sudo apt-get install k6
```

### Más opciones
Ver: https://k6.io/docs/getting-started/installation/

## Ejecución

```bash
# Ejecución básica
k6 run example-load-test.js

# Con variables de entorno
k6 run example-load-test.js --env API_URL=http://api.example.com

# Con reportes JSON
k6 run example-load-test.js --out json=results.json

# Con InfluxDB (requiere InfluxDB ejecutándose)
k6 run example-load-test.js --out influxdb=http://localhost:8086/k6

# Con Grafana
# Primero inicia: docker-compose up -d
# Luego: k6 run --out grafana example-load-test.js
```

## Estructura básica

```javascript
import http from 'k6/http';
import { check, sleep, group } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 20 },   // Ramp-up
    { duration: '1m30s', target: 20 }, // Hold
    { duration: '30s', target: 0 },    // Ramp-down
  ],
  thresholds: {
    http_req_duration: ['p(95)<500'],
  },
};

export default function () {
  // Tu código de prueba aquí
}
```

## Opciones comunes

```javascript
export const options = {
  // Número de usuarios virtuales
  vus: 10,
  
  // Duración total
  duration: '30s',
  
  // Etapas: ramp-up, hold, ramp-down
  stages: [
    { duration: '5s', target: 10 },
    { duration: '10s', target: 10 },
    { duration: '5s', target: 0 },
  ],
  
  // Umbrales de éxito
  thresholds: {
    http_req_duration: ['p(95)<500', 'p(99)<1000'],
    http_req_failed: ['rate<0.01'],
  },
};
```

## Checks y Assertions

```javascript
const response = http.get('http://api.example.com/users');

check(response, {
  'status is 200': (r) => r.status === 200,
  'response time < 500ms': (r) => r.timings.duration < 500,
  'body includes data': (r) => r.body.includes('data'),
});
```

## Grupo de pruebas

```javascript
group('User API', () => {
  const response = http.get('http://api.example.com/users');
  check(response, {
    'status is 200': (r) => r.status === 200,
  });
});
```

## Ejemplo completo

Ver: `example-load-test.js`

## Métricas principales

- `http_req_duration` - Tiempo de respuesta
- `http_req_failed` - Tasa de fallos
- `http_reqs` - Total de requests
- `vus` - Usuarios virtuales activos
- `vus_max` - Usuarios virtuales máximos

## Más información

- [k6 Official Docs](https://k6.io/docs/)
- [k6 API Reference](https://k6.io/docs/javascript-api)
