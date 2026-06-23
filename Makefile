.PHONY: help install test test-api test-ui test-cov lint format clean run-k6 run-jmeter

# Variables
PYTHON := python3
PIP := pip3
VENV := venv

help:
	@echo "=== QA DevOps AI Challenge - Comandos Disponibles ==="
	@echo ""
	@echo "Configuración:"
	@echo "  make install       - Instala dependencias"
	@echo "  make venv          - Crea entorno virtual"
	@echo ""
	@echo "Pruebas:"
	@echo "  make test          - Ejecuta todas las pruebas"
	@echo "  make test-api      - Ejecuta pruebas de API"
	@echo "  make test-ui       - Ejecuta pruebas de UI"
	@echo "  make test-cov      - Ejecuta pruebas con cobertura"
	@echo "  make test-parallel - Ejecuta pruebas en paralelo"
	@echo ""
	@echo "Calidad de Código:"
	@echo "  make lint          - Ejecuta linters (flake8, pylint)"
	@echo "  make format        - Formatea código (black, isort)"
	@echo "  make check         - Lint + Format"
	@echo ""
	@echo "Performance:"
	@echo "  make run-k6        - Ejecuta pruebas de carga con k6"
	@echo "  make run-jmeter    - Ejecuta plan JMeter"
	@echo ""
	@echo "Mantenimiento:"
	@echo "  make clean         - Limpia archivos temporales"
	@echo "  make clean-reports - Limpia reportes antiguos"

venv:
	$(PYTHON) -m venv $(VENV)
	@echo "✓ Entorno virtual creado"
	@echo "Activar con: source $(VENV)/bin/activate (Linux/Mac) o $(VENV)\\Scripts\\activate (Windows)"

install: venv
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	@echo "✓ Dependencias instaladas"

test:
	pytest tests/ -v --tb=short
	@echo "✓ Pruebas completadas"

test-api:
	pytest tests/api/ -v -m "not slow"
	@echo "✓ Pruebas de API completadas"

test-ui:
	pytest tests/ui/ -v -m "not slow"
	@echo "✓ Pruebas de UI completadas"

test-cov:
	pytest tests/ --cov=. --cov-report=html --cov-report=term-missing
	@echo "✓ Reporte de cobertura generado en htmlcov/"

test-parallel:
	pytest tests/ -v -n auto
	@echo "✓ Pruebas paralelas completadas"

test-smoke:
	pytest tests/ -v -m "smoke"
	@echo "✓ Pruebas de humo completadas"

test-critical:
	pytest tests/ -v -m "critical"
	@echo "✓ Pruebas críticas completadas"

lint:
	flake8 tests/ --max-line-length=100 --statistics
	pylint tests/ --disable=C0111,W0212
	@echo "✓ Linting completado"

format:
	black tests/ config/ utils/ --line-length=100
	isort tests/ config/ utils/
	@echo "✓ Código formateado"

check: lint format
	@echo "✓ Validaciones completadas"

clean:
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
	find . -type d -name ".pytest_cache" -delete
	find . -type d -name ".coverage" -delete
	find . -type d -name "htmlcov" -delete
	@echo "✓ Archivos temporales eliminados"

clean-reports:
	rm -rf reports/
	rm -rf evidences/screenshots/*.png
	rm -rf evidences/logs/*.log
	@echo "✓ Reportes y evidencias limpias"

run-k6:
	k6 run performance/k6/example-load-test.js --out json=reports/k6-results.json
	@echo "✓ Prueba de carga k6 completada"

run-k6-influxdb:
	k6 run performance/k6/example-load-test.js --out influxdb=http://localhost:8086/k6
	@echo "✓ Prueba de carga k6 con InfluxDB completada"

run-jmeter:
	jmeter -n -t performance/jmeter/example-test-plan.jmx -l results/jmeter-results.jtl -j results/jmeter.log
	@echo "✓ Prueba JMeter completada"

docs:
	@echo "Documentación disponible en:"
	@echo "  - docs/test-plan.md (Plan de pruebas)"
	@echo "  - docs/bug-reports.md (Reporte de bugs)"
	@echo "  - docs/ai-analysis.md (Análisis con IA)"

.DEFAULT_GOAL := help
