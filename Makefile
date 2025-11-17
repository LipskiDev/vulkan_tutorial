CLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

.PHONY: test clean

VulkanTutorial: main.cpp shaders/shader.frag shaders/shader.vert
	g++ $(CFLAGS) -o VulkanTutorial main.cpp $(LDFLAGS)
	glslc shaders/shader.frag -o shaders/frag.spv
	glslc shaders/shader.vert -o shaders/vert.spv

.PHONY: test clean

test: VulkanTutorial
	./VulkanTutorial

clean:
	rm -f VulkanTutorial shaders/frag.spv shaders/vert.spv
