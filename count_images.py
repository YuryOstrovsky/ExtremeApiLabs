import docker

def count_containers(image_name, tag=None):
    # Initialize Docker client
    client = docker.from_env()

    # Get a list of all containers
    containers = client.containers.list()

    # Construct the full image name
    full_image_name = image_name
    if tag:
        full_image_name += ":" + tag

    # Count the containers with the specified image name and tag
    num_containers = sum(1 for container in containers if full_image_name in container.image.tags)

    return num_containers

if __name__ == "__main__":
    image_name = "my_jupyter_image"  
    tag = "latest"  # Update this with the actual tag
    num_containers = count_containers(image_name, tag)
    print(f"Number of containers running with image '{image_name}:{tag}': {num_containers}")

