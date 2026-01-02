#include "Shape.h"
#include <iostream>
#include <stdexcept>

Shape::Shape() {
    color = "red";
}

Shape::Shape(std::string color) {
    if (color != "red" && color != "green" && color != "blue") {
        throw std::invalid_argument("Color inválido. Usa: red, green, o blue");
    }
    this->color = color;
}

std::string Shape::getColor() const {
    return color;
}

void Shape::setColor(std::string color) {
    if (color != "red" && color != "green" && color != "blue") {
        throw std::invalid_argument("Color inválido. Usa: red, green, o blue");
    }
    this->color = color;
}
