# CUDA Docker images for Jetson TX2 / L4T 27.1

This work builds upon the official [nvidia cuda docker images](https://gitlab.com/nvidia/cuda/)
and the [tegra docker](https://github.com/Technica-Corporation/Tegra-Docker) project
to provide Dockerfiles to build cuda and cudnn images for the JetsonTX2 running L4T 27.1
(Ubuntu 16.04) as installed by [JetPack 3](https://developer.nvidia.com/embedded/jetpack)

There is some hackery here, specifically exposing the local apt repos installed
by Jetpack via an nginx server so that the docker build process can use the standard
approach of installing packages via apt.

The 8.0/runtime directory requires a copy of `deviceQuery` in order to build successfully.
See the [tegra docker](https://github.com/Technica-Corporation/Tegra-Docker) project
readme for more information. Fundementally, this is used for validation that the
containers can observe the proper devices when running so it's not a >strict<
requirement that it be present.

## CUDA 8.0
- [`8.0-runtime`, `8.0-runtime-ubuntu16.04` (*8.0/runtime/Dockerfile*)](8.0/runtime/Dockerfile)
- [`8.0-devel`, `8.0-devel-ubuntu16.04` (*8.0/devel/Dockerfile*)](8.0/devel/Dockerfile)
- [`8.0-cudnn5-runtime`, `8.0-cudnn5-runtime-ubuntu16.04` (*8.0/runtime/cudnn5/Dockerfile*)](8.0/runtime/cudnn5/Dockerfile)
- [`8.0-cudnn5-devel`, `8.0-cudnn5-devel-ubuntu16.04` (*8.0/devel/cudnn5/Dockerfile*)](8.0/devel/cudnn5/Dockerfile)
