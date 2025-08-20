# Faster Whisper Experiment

A Python project using sounddevice, numpy, queue, threading, and faster-whisper for real-time audio processing and speech recognition.

## 📋 Prerequisites

- Python 3.8 or higher
- make (for using the Makefile commands)
- Audio input device (microphone)

## 🚀 Quick Start

### 1. Clone and Setup

```bash
git clone <your-repo-url>
cd faster_whisperer_experiement
```

### 2. Automatic Setup

Use the Makefile to set everything up automatically:

```bash
make setup
```

This command will:
- Create a virtual environment in `venv/`
- Install all required dependencies
- Set up the project for development

### 3. Activate Virtual Environment

```bash
source venv/bin/activate
```

### 4. Run the Application

```bash
make run
```

## 🛠️ Available Make Commands

The project includes a comprehensive Makefile with the following commands:

| Command | Description |
|---------|-------------|
| `make help` | Show all available commands (default) |
| `make setup` | Create virtual environment and install dependencies |
| `make venv` | Create virtual environment only |
| `make install` | Install dependencies (requires existing venv) |
| `make run` | Run the main application |
| `make test` | Run tests using pytest |
| `make lint` | Run code linting with flake8 |
| `make format` | Format code with black |
| `make check-format` | Check code formatting without making changes |
| `make clean` | Remove virtual environment and cache files |
| `make dev-setup` | Setup with additional development tools |

## 📦 Dependencies

The project uses the following main dependencies:

- **sounddevice** - Real-time audio I/O
- **numpy** - Numerical computing
- **faster-whisper** - Fast speech recognition

Development dependencies (installed with `make dev-setup`):
- **pytest** - Testing framework
- **black** - Code formatter
- **flake8** - Code linter
- **mypy** - Type checking

## 🔧 Development Workflow

### Setting up for Development

```bash
# Full development setup with testing and linting tools
make dev-setup

# Activate the virtual environment
source venv/bin/activate
```

### Code Quality

```bash
# Format your code
make format

# Check formatting
make check-format

# Run linter
make lint

# Run tests
make test
```

### Daily Development

```bash
# After making changes, format and test
make format
make test
make run
```

## 📁 Project Structure

```
faster_whisperer_experiement/
├── Makefile              # Build automation
├── README.md            # This file
├── pyproject.toml       # Project configuration and dependencies
├── main.py              # Main application entry point
├── venv/               # Virtual environment (created by make setup)
└── tests/              # Test files (create as needed)
```

## 🎯 Usage Examples

### Basic Setup and Run
```bash
make setup
source venv/bin/activate
make run
```

### Development Cycle
```bash
# Setup development environment
make dev-setup
source venv/bin/activate

# Make code changes...

# Format and test before committing
make format
make lint
make test
```

### Clean Start
```bash
# Remove everything and start fresh
make clean
make setup
```

## 🐛 Troubleshooting

### Common Issues

1. **Permission Errors**: Make sure you have write permissions in the project directory
2. **Python Not Found**: Ensure Python 3.8+ is installed and accessible as `python3`
3. **Audio Issues**: Check that your microphone is working and accessible
4. **Virtual Environment Issues**: Try `make clean` followed by `make setup`

### Getting Help

```bash
# See all available commands
make help

# Check Python version
python3 --version

# Verify virtual environment is active
which python
```

## 🤝 Contributing

1. Set up development environment: `make dev-setup`
2. Make your changes
3. Format code: `make format`
4. Run tests: `make test`
5. Check linting: `make lint`
6. Submit a pull request

## 📝 Notes

- The virtual environment is created in the `venv/` directory
- All Python commands in the Makefile use the virtual environment automatically
- The project uses `pyproject.toml` for dependency management
- Make sure to activate the virtual environment when working outside of make commands

## 🔄 Project Reset

If you need to completely reset the project:

```bash
make clean    # Remove virtual environment and cache
make setup    # Reinstall everything
```

This will give you a fresh start with a clean environment. 