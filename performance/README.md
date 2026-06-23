# Pruebas de Rendimiento

Pruebas de carga, estrés y rendimiento del sistema.

## Estructura

```
performance/
├── k6/
│   ├── example-load-test.js
│   └── README.md
├── jmeter/
│   ├── example-test-plan.jmx
│   └── README.md
└── README.md
```

## Herramientas disponibles

### k6
Herramienta moderna de pruebas de carga escrita en Go.
- **Uso**: Pruebas de carga, stress testing, soak testing
- **Lenguaje**: JavaScript
- **Instalación**: https://k6.io/docs/getting-started/installation/

### JMeter
Herramienta clásica y robusta para pruebas de rendimiento.
- **Uso**: Pruebas de carga, spike testing, análisis de rendimiento
- **Formato**: Archivos XML (.jmx)
- **Instalación**: https://jmeter.apache.org/download_jmeter.cgi

## Ejecución rápida

### Con k6
```bash
# Instalación
# macOS
brew install k6

# Windows (chocolatey)
choco install k6

# O desde https://k6.io/docs/getting-started/installation/

# Ejecutar
k6 run performance/k6/example-load-test.js
```

### Con JMeter
```bash
# Instalación
# Descargar de https://jmeter.apache.org/

# Ejecutar desde GUI
jmeter

# Ejecutar en línea de comando
jmeter -n -t performance/jmeter/example-test-plan.jmx -l results/results.jtl
```

### Usando Makefile
```bash
make run-k6          # Ejecuta pruebas k6
make run-jmeter      # Ejecuta pruebas JMeter
```

## Tipos de pruebas de rendimiento

### Smoke Testing
Verificar que el sistema es capaz de manejar una carga mínima.

### Load Testing
Verificar el rendimiento bajo carga normal y pico esperada.

### Stress Testing
Encontrar el punto de ruptura del sistema.

### Spike Testing
Verificar cómo se comporta con picos súbitos de carga.

### Soak Testing
Verificar el comportamiento del sistema bajo carga sostenida.

## Métricas importantes

- **Response Time**: Tiempo de respuesta
- **Throughput**: Solicitudes por segundo
- **Error Rate**: Porcentaje de fallos
- **CPU/Memory**: Uso de recursos
- **p95/p99**: Percentil 95 y 99 de respuesta

## Configuración de umbral

En `example-load-test.js` se pueden definir umbrales de éxito:

```javascript
thresholds: {
  http_req_duration: ['p(95)<500'],  // 95% < 500ms
  http_req_failed: ['rate<0.01'],     // < 1% fallos
}
```

## Más información

- [k6 Documentation](https://k6.io/docs/)
- [JMeter Documentation](https://jmeter.apache.org/usermanual/)
- [Performance Testing Best Practices](https://en.wikipedia.org/wiki/Software_performance_testing)

## Notas

- Las pruebas de rendimiento generalmente requieren datos de prueba
- Se recomienda ejecutar en ambiente de staging, no producción
- Incluir en CI/CD como pruebas periódicas, no en cada commit
