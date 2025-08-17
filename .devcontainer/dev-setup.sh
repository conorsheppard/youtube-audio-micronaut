#!/bin/bash

echo "🚀 Setting up YouTube Audio Micronaut Development Environment"
echo "=========================================================="

# Check Java installation
echo "📋 Checking Java installation..."
if command -v java &> /dev/null; then
    echo "✅ Java is installed:"
    java --version
else
    echo "❌ Java is not installed!"
    exit 1
fi

# Check Maven installation
echo -e "\n📋 Checking Maven installation..."
if command -v mvn &> /dev/null; then
    echo "✅ Maven is installed:"
    mvn --version
else
    echo "❌ Maven is not installed!"
    exit 1
fi

# Check if we're in the right directory
echo -e "\n📋 Checking project structure..."
if [ -f "pom.xml" ]; then
    echo "✅ Found pom.xml - we're in the right project directory"
else
    echo "❌ pom.xml not found! Make sure you're in the project root"
    exit 1
fi

# Check Maven dependencies
echo -e "\n📋 Checking Maven dependencies..."
if [ -d "target" ]; then
    echo "✅ Target directory exists"
else
    echo "📦 Building project for the first time..."
    mvn clean compile
fi

# Check if native-image is available (optional)
echo -e "\n📋 Checking GraalVM native-image..."
if command -v native-image &> /dev/null; then
    echo "✅ GraalVM native-image is available"
    echo "   You can build native executables with: mvn package -Dpackaging=native-image"
else
    echo "ℹ️  GraalVM native-image is not available"
    echo "   To enable it, uncomment the GraalVM installation in .devcontainer/Dockerfile"
fi

# Set up useful aliases
echo -e "\n📋 Setting up useful aliases..."
cat >> ~/.bashrc << 'EOF'

# YouTube Audio Micronaut aliases
alias build='mvn clean package'
alias run='mvn mn:run'
alias test='mvn test'
alias clean='mvn clean'
alias native='mvn package -Dpackaging=native-image'

# Quick run with URL
run-youtube() {
    if [ -z "$1" ]; then
        echo "Usage: run-youtube <youtube-url>"
        return 1
    fi
    mvn mn:run -Dargs="$1"
}

# Show project status
status() {
    echo "📊 Project Status:"
    echo "  Java: $(java --version | head -n1)"
    echo "  Maven: $(mvn --version | head -n1)"
    echo "  Project: $(pwd)"
    echo "  Target exists: $([ -d "target" ] && echo "✅" || echo "❌")"
}
EOF

echo "✅ Aliases added to ~/.bashrc"
echo "   Reload your shell or run 'source ~/.bashrc' to use them"

# Test build
echo -e "\n📋 Testing project build..."
if mvn clean compile -q; then
    echo "✅ Project builds successfully!"
else
    echo "❌ Project build failed!"
    exit 1
fi

echo -e "\n🎉 Development environment is ready!"
echo "=========================================================="
echo "📚 Available commands:"
echo "   build        - Clean and package the project"
echo "   run          - Run the application"
echo "   test         - Run tests"
echo "   clean        - Clean the project"
echo "   native       - Build native image"
echo "   run-youtube <url> - Run with specific YouTube URL"
echo "   status       - Show environment status"
echo ""
echo "🚀 Start developing with: mvn mn:run"
echo "🌐 Your app will be available at: http://localhost:8080"
echo ""
echo "💡 Tip: Use 'source ~/.bashrc' to load the new aliases"
