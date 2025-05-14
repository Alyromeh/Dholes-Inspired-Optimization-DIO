# Dholes-Inspired Optimization (DIO) Algorithm

This repository provides the official MATLAB implementation of the **Dholes-Inspired Optimization (DIO)** algorithm, a novel nature-inspired metaheuristic inspired by the **cooperative hunting, vocal communication, and territorial behavior** of the dhole (*Cuon alpinus*), also known as the Asiatic wild dog.

---

## 🧠 Overview

DIO is designed to solve complex, high-dimensional optimization problems by mimicking the **adaptive and cooperative strategies** observed in dhole packs. The algorithm introduces several novel mechanisms for balancing exploration and exploitation, including:

- Vocalization-based adaptive influence control
- Dynamic leadership (Lead Vocalizer)
- Cooperative movement influenced by neighboring solutions
- Territorial constraints to preserve search boundaries

---

## 📄 Citation

If you use this code in your research, please cite the following paper:

> **Ali El Romeh\*, Vaclav Snasel, Seyedali Mirjalili\*\***  
> *Dholes-Inspired Optimization (DIO): A Nature-Inspired Algorithm for Engineering Optimization Problems*  
> Cluster Computing, 2025, DOI: []

---

## 📂 Contents

- `DIO.m` – Main algorithm file implementing DIO
- `main.m` – Sample script to run DIO on benchmark functions
- `Get_Functions_details.m` – Loads benchmark functions and their properties
- `func_plot.m` – Plots search space and performance metrics

---

## ▶️ How to Run

1. Clone or download this repository.
2. Open MATLAB.
3. Run the `main.m` file.

```matlab
main
