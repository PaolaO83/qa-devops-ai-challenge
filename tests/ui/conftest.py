"""
Configuración de pytest para pruebas de UI
"""
import pytest
import os
from dotenv import load_dotenv

load_dotenv()


@pytest.fixture(scope="session")
def app_base_url():
    """Obtiene la URL de la aplicación desde variables de entorno"""
    return os.getenv("APP_BASE_URL", "http://localhost:3000")


@pytest.fixture(scope="session")
def browser_type():
    """Define el navegador a usar (chrome, firefox, edge)"""
    return os.getenv("BROWSER_TYPE", "chrome")


@pytest.fixture
def selenium_driver():
    """
    Fixture para Selenium WebDriver
    Descomenta y configura según tu necesidad
    """
    # from selenium import webdriver
    # driver = webdriver.Chrome()
    # yield driver
    # driver.quit()
    pass


@pytest.fixture
def playwright_browser():
    """
    Fixture para Playwright
    Descomenta y configura según tu necesidad
    """
    # from playwright.sync_api import sync_playwright
    # with sync_playwright() as p:
    #     browser = p.chromium.launch()
    #     yield browser
    #     browser.close()
    pass
