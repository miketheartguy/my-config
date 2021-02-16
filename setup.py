import setuptools

from config import *

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

requirements = ["ansible", "black", "pre-commit"]

setuptools.setup(
    author=NAME,
    author_email=EMAIL,
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    description="Managing personal configuration and such",
    install_requires=requirements,
    long_description=long_description,
    long_description_content_type="text/markdown",
    name="my-config",
    version="0.0.1",
    packages=setuptools.find_packages(),
    python_requires=">=3.8",
)
