.PHONY: help setup install clean venv test run lint format check-format

# Variables
VENV_NAME = venv
PYTHON = python3
PIP = $(VENV_NAME)/bin/pip
PYTHON_VENV = $(VENV_NAME)/bin/python

# Default target
help:
	@echo "Available targets:"
	@echo "  setup     - Create virtual environment and install dependencies"
	@echo "  venv      - Create virtual environment only"
	@echo "  install   - Install dependencies (requires venv)"
	@echo "  clean     - Remove virtual environment and cache files"
	@echo "  run       - Run the main application"
	@echo "  test      - Run tests"
	@echo "  lint      - Run code linting"
	@echo "  format    - Format code with black"
	@echo "  check-format - Check code formatting"
	@echo "  help      - Show this help message"

# Create virtual environment
venv:
	@echo "Creating virtual environment..."
	$(PYTHON) -m venv $(VENV_NAME)
	@echo "Virtual environment created in $(VENV_NAME)/"

# Install dependencies
install: venv
	@echo "Installing dependencies..."
	$(PIP) install --upgrade pip
	$(PIP) install -e .
	@echo "Dependencies installed successfully!"

# Setup everything (create venv + install dependencies)
setup: venv install
	@echo "Setup completed successfully!"
	@echo "To activate the virtual environment, run:"
	@echo "source $(VENV_NAME)/bin/activate"

# Clean up
clean:
	@echo "Cleaning up..."
	rm -rf $(VENV_NAME)
	rm -rf __pycache__
	rm -rf *.pyc
	rm -rf .pytest_cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
	find . -type d -name __pycache__ -delete
	find . -type f -name "*.pyc" -delete
	@echo "Cleanup completed!"

# Run the application (adjust the main script path as needed)
run:
	@echo "Running application..."
	$(PYTHON_VENV) transcribe.py

# Run tests
test:
	@echo "Running tests..."
	$(PYTHON_VENV) -m pytest tests/ -v

# Lint code
lint:
	@echo "Running linter..."
	$(PYTHON_VENV) -m flake8 .

# Format code
format:
	@echo "Formatting code..."
	$(PYTHON_VENV) -m black .

# Check code formatting
check-format:
	@echo "Checking code formatting..."
	$(PYTHON_VENV) -m black --check .

# Development setup with additional tools
dev-setup: setup
	@echo "Installing development dependencies..."
	$(PIP) install pytest black flake8 mypy
	@echo "Development environment ready!" 