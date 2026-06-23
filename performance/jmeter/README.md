# Pruebas de Rendimiento con JMeter

Pruebas de rendimiento clásicas con Apache JMeter.

## Instalación

### Descargar
1. Ve a: https://jmeter.apache.org/download_jmeter.cgi
2. Descarga la versión binaria
3. Extrae el archivo

### macOS
```bash
brew install jmeter
```

### Windows
```bash
choco install jmeter
```

### Verificar instalación
```bash
jmeter --version
```

## Ejecución

### Interfaz gráfica (GUI)
```bash
jmeter
```

Luego abre el archivo `example-test-plan.jmx`

### Línea de comandos (headless)
```bash
# Ejecución básica
jmeter -n -t example-test-plan.jmx -l results.jtl

# Con archivo de propiedades
jmeter -n -t example-test-plan.jmx -l results.jtl -j jmeter.log

# Con propiedades
jmeter -n -t example-test-plan.jmx -l results.jtl -Jthreads=50 -Jramptime=120

# Generar reporte HTML
jmeter -n -t example-test-plan.jmx -l results.jtl -o html-report
```

## Estructura de un Test Plan

```
Test Plan
├── Variables de Usuario
├── Grupo de Hilos (Thread Group)
│   ├── Sampler HTTP
│   ├── Aserciones
│   └── Listener (Recolector de Resultados)
└── Elementos de Configuración
```

## Componentes principales

### Thread Group (Grupo de Hilos)
- **Number of Threads**: Cuántos usuarios virtuales
- **Ramp-up Time**: Tiempo para llegar al máximo
- **Loop Count**: Cuántas veces repetir

### HTTP Sampler
Define una solicitud HTTP (GET, POST, PUT, DELETE)

### Assertion (Aserción)
Valida que la respuesta sea correcta
- Response Code
- Response Body
- Response Headers

### Listener (Recolector)
Recopila y muestra resultados
- View Results Tree (árbol de resultados)
- Summary Report (reporte resumen)
- Aggregate Report (reporte agregado)

## Mejores prácticas

1. **Variables**: Usar variables para datos dinámicos
2. **CSV Data Set Config**: Para datos de prueba desde archivo
3. **Regular Expressions Extractor**: Para correlación de datos
4. **Assertions**: Validar siempre las respuestas
5. **Listeners**: No dejar activos todos en headless (ralentiza)

## Ejemplo: Prueba simple

```
Test Plan
└── Thread Group (10 usuarios, ramp-up 60s, 10 loops)
    ├── HTTP Request
    │   ├── Protocol: http
    │   ├── Server: localhost
    │   ├── Port: 8000
    │   ├── Path: /api/users
    │   └── Method: GET
    └── Assertions
        └── Response Code: 200
```

## Variables útiles

En JMeter puedes usar variables con `${NOMBRE}`:

```
${NUM_THREADS}     - Número de threads
${RAMP_TIME}       - Tiempo de ramp-up
${LOOP_COUNT}      - Número de loops
${BASE_URL}        - URL base
${__time()}        - Timestamp actual
${__random(1,100)} - Número aleatorio
```

## Análisis de resultados

### Reporte HTML
```bash
jmeter -g results.jtl -o html-report
```

### Estadísticas clave
- **Samples**: Total de requests
- **Average**: Tiempo promedio
- **Min/Max**: Tiempos mínimo y máximo
- **Std. Dev**: Desviación estándar
- **Error %**: Porcentaje de fallos
- **Throughput**: Requests por segundo

## Más información

- [JMeter Official Docs](https://jmeter.apache.org/)
- [JMeter Best Practices](https://jmeter.apache.org/usermanual/best-practices.html)
- [JMeter Functions](https://jmeter.apache.org/usermanual/functions.html)
