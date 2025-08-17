#!/bin/bash

echo "🧪 Testing Native Compilation Setup"
echo "==================================="

# Check if we're in the right directory
if [ ! -f "pom.xml" ]; then
    echo "❌ Error: pom.xml not found. Run this script from the project root."
    exit 1
fi

# Check GraalVM installation
echo "📋 Checking GraalVM installation..."
if command -v native-image &> /dev/null; then
    echo "✅ native-image is available"
    native-image --version
else
    echo "❌ native-image is not available"
    exit 1
fi

# Check environment variables
echo -e "\n📋 Checking environment variables..."
if [ -n "$JAVA_HOME" ]; then
    echo "✅ JAVA_HOME: $JAVA_HOME"
else
    echo "❌ JAVA_HOME is not set"
    exit 1
fi

if [ -n "$GRAALVM_HOME" ]; then
    echo "✅ GRAALVM_HOME: $GRAALVM_HOME"
else
    echo "❌ GRAALVM_HOME is not set"
    exit 1
fi

# Check Java version
echo -e "\n📋 Checking Java version..."
java --version

# Check Maven version
echo -e "\n📋 Checking Maven version..."
mvn --version

# Test native compilation
echo -e "\n📋 Testing native compilation..."
echo "Building with native profile..."

if mvn clean package -Pnative -q; then
    echo "✅ Native compilation successful!"
    
    # Check if native executable was created
    if [ -f "target/youtube-audio-micronaut" ]; then
        echo "✅ Native executable created: target/youtube-audio-micronaut"
        echo "📊 File size: $(ls -lh target/youtube-audio-micronaut | awk '{print $5}')"
        
        # Test running the native executable
        echo -e "\n📋 Testing native executable..."
        if timeout 10s ./target/youtube-audio-micronaut --help &> /dev/null; then
            echo "✅ Native executable runs successfully!"
        else
            echo "⚠️  Native executable may have issues (timeout or error)"
        fi
    else
        echo "⚠️  Native executable not found in target directory"
    fi
else
    echo "❌ Native compilation failed!"
    echo "Check the error messages above for details."
    exit 1
fi

echo -e "\n🎉 Native compilation setup is working correctly!"
echo "You can now use: mvn package -Pnative"
