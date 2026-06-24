# CLI Tic-Tac-Toe 🎮

A modular, clean, and interactive Command Line Interface (CLI) Tic-Tac-Toe game built from scratch using **Ruby**.

## 🚀 Features
---
* **Player vs Player (PvP):** Play locally with a friend with turn-by-turn input validation.
* **Computer vs Player (CvP):** Test your skills against an automated AI engine that calculates available slots on the fly.
* **Cross-Platform Screen Clearing:** Supports continuous terminal refreshes seamlessly on Windows, macOS, and Linux.
---

## 🛠️ Architecture & Module Breakdown

The codebase is highly decentralized to preserve the **Single Responsibility Principle**:

* **`main.rb`**: The master controller. Manages menus, initializes runtime modules, and acts as the game's navigation engine.
* **`engine/base.rb`**: The data holder. Encapsulates the 3x3 board grid logic, data rendering, boundary checks (`isAvailable?`), and resetting states.
* **`engine/referee.rb`**: The dynamic rules system. Explicitly evaluates win patterns independently of the board's structural footprint.
* **`engine/pvp.rb`**: Executes isolation protocols for local two-player game loops.
* **`engine/cvp.rb`**: Houses the math/random engine representing the AI player's automated decision process.

---

## 📥 Installation & Setup

### Prerequisites
Make sure you have **Ruby** installed on your machine. You will also need the `colorize` gem for the terminal UI effects.
