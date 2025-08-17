# GitHub Codespaces Configuration

This directory contains the configuration files for GitHub Codespaces, allowing you to develop this YouTube Audio Micronaut project in a cloud-based development environment.

## What's Included

### 🐳 **Dev Container Configuration**
- **`devcontainer.json`**: Main configuration file that defines the development environment
- **`Dockerfile`**: Custom container image with additional development tools
- **`maven-settings.xml`**: Optimized Maven configuration for the container

### 🛠️ **Development Environment**
- **Java 21**: Latest LTS version of Java
- **Maven**: For building and managing dependencies
- **VS Code Extensions**: Pre-configured Java development extensions
- **Development Tools**: Git, curl, wget, vim, nano, htop, tree, and more

### 🚀 **Getting Started**

1. **Open in Codespaces**:
   - Click the green "Code" button on your GitHub repository
   - Select "Codespaces" tab
   - Click "Create codespace on main"

2. **Wait for Setup**:
   - The container will build automatically
   - Java 21 and Maven will be installed
   - GraalVM will be installed for native compilation
   - VS Code extensions will be configured

3. **Start Developing**:
   - The project will be ready to build and run
   - Use `mvn clean package` to build
   - Use `mvn mn:run` to run the application

## 🔧 **Troubleshooting Container Build Issues**

If you encounter container build failures (like the GraalVM download issue), you have two options:

### **Option 1: Retry the Build**
- The current configuration uses GraalVM 21.0.1 which should be more stable
- Try rebuilding the container: Command Palette → "Codespaces: Rebuild Container"

### **Option 2: Use Simple Configuration**
- If the custom Dockerfile continues to fail, switch to the simple configuration:
- Rename `.devcontainer/devcontainer-simple.json` to `.devcontainer/devcontainer.json`
- This uses the official GraalVM feature which is more reliable
- Rebuild the container after making this change

### 🔧 **Available Commands**

```bash
# Build the project
mvn clean package

# Run the application
mvn mn:run

# Run with specific YouTube URL
mvn mn:run -Dargs="https://www.youtube.com/watch?v=VIDEO_ID"

# Build native image
mvn package -Dpackaging=native-image

# Build with native profile
mvn package -Pnative

# Run tests
mvn test
```

### 🌐 **Port Forwarding**
- Port 8080 is automatically forwarded for the Micronaut application
- You can access your app at `http://localhost:8080` in the browser

### 📁 **Maven Repository**
- Maven repository is cached between sessions for faster builds
- Located at `/home/vscode/.m2/repository` in the container

### 🐘 **GraalVM Support**
- GraalVM is automatically installed and configured for native image compilation
- Environment variables `JAVA_HOME` and `GRAALVM_HOME` are properly set
- Use `mvn package -Dpackaging=native-image` or `mvn package -Pnative` to build native executables
- Native image compilation is fully supported out of the box

### 🔍 **VS Code Features**
- **Java Language Support**: Full IntelliSense and debugging
- **Maven Integration**: Built-in Maven project management
- **Testing**: JUnit 5 test runner integration
- **Debugging**: Java debugging support
- **Code Formatting**: Google Java Style Guide formatting

### 🚨 **Troubleshooting**

**Build Issues**:
```bash
# Clean and rebuild
mvn clean package

# Check Java version
java --version

# Check Maven version
mvn --version
```

**Port Issues**:
- Ensure port 8080 is not blocked
- Check the "Ports" tab in VS Code

**Extension Issues**:
- Reload the Codespace if extensions don't load
- Check the Extensions tab for any errors

### 📚 **Additional Resources**
- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)
- [Micronaut Documentation](https://docs.micronaut.io/)
- [Maven Documentation](https://maven.apache.org/guides/)

---

**Happy Coding! 🎉**
