# Pruebas de Interfaz de Usuario (UI)

Pruebas automatizadas para validar la interfaz de usuario.

## Estructura

```
ui/
├── conftest.py         # Configuración y fixtures de pytest
├── test_example.py     # Ejemplo de pruebas
└── README.md          # Este archivo
```

## Requisitos

Instala las dependencias según tu framework preferido:

### Opción 1: Selenium
```bash
pip install selenium webdriver-manager
```

### Opción 2: Playwright
```bash
pip install playwright
playwright install
```

## Cómo ejecutar

```bash
# Todas las pruebas de UI
pytest tests/ui/

# Con salida detallada
pytest tests/ui/ -v

# Solo pruebas no lentas
pytest tests/ui/ -m "not slow"

# Con navegador visible (si tienes headless=False)
pytest tests/ui/ --headed
```

## Frameworks soportados

### Selenium
Más maduro y ampliamente usado. Excelente para navegadores antiguos.

```python
from selenium import webdriver

def test_login(selenium_driver):
    driver = selenium_driver
    driver.get("http://example.com/login")
    # ... interacciones del test
```

### Playwright
Moderno y rápido. Mejor rendimiento y mejor control.

```python
def test_login(page):
    page.goto("http://example.com/login")
    # ... interacciones del test
```

## Estructura de una prueba de UI

```python
class TestLoginPage:
    def test_login_with_valid_credentials(self, browser):
        browser.navigate_to("/login")
        browser.fill("input[name='email']", "user@example.com")
        browser.fill("input[name='password']", "password123")
        browser.click("button[type='submit']")
        assert browser.is_visible("h1:contains('Dashboard')")
```

## Fixtures disponibles

### `app_base_url`
URL base de la aplicación desde `.env`.

### `browser_type`
Tipo de navegador configurado en `.env` (chrome, firefox, edge).

### `selenium_driver`
Instancia del WebDriver de Selenium (comentada, descomentar según necesidad).

### `playwright_browser`
Instancia del Browser de Playwright (comentada, descomentar según necesidad).

## Buenas prácticas

1. **Esperas explícitas**: Usar tiempos explícitos, no implícitos
2. **Selectores robustos**: Preferir IDs, nombres sobre clases
3. **Page Objects**: Separar lógica de UI en clases
4. **Datos de prueba**: Usar fixtures para datos compartidos
5. **Capturas de pantalla**: En caso de fallos

## Ejemplo Page Object Pattern

```python
class LoginPage:
    def __init__(self, driver):
        self.driver = driver
        self.email_input = "input[name='email']"
        self.password_input = "input[name='password']"
        self.submit_button = "button[type='submit']"
    
    def login(self, email, password):
        self.driver.find_element(self.email_input).send_keys(email)
        self.driver.find_element(self.password_input).send_keys(password)
        self.driver.find_element(self.submit_button).click()

def test_login(selenium_driver):
    page = LoginPage(selenium_driver)
    page.login("user@example.com", "password123")
```

## Configuración en .env

```env
APP_BASE_URL=http://localhost:3000
BROWSER_TYPE=chrome
HEADLESS=False
BROWSER_TIMEOUT=30
```

## Más información

- [Selenium Documentation](https://selenium-python.readthedocs.io/)
- [Playwright Documentation](https://playwright.dev/python/)
