import tkinter as tk
import psutil


def check_charger():
    battery = psutil.sensors_battery()
    return battery and battery.power_plugged


def main():
    # Quick exit if charger is already connected
    if check_charger():
        return

    root = tk.Tk()
    root.title("Charger Required")
    root.attributes("-fullscreen", True)
    root.configure(bg="#1a1a1a")

    # Simple centered message
    frame = tk.Frame(root, bg="#1a1a1a")
    frame.pack(expand=True)

    tk.Label(
        frame,
        text="⚡ CHARGER DISCONNECTED ⚡",
        font=("Arial", 28, "bold"),
        fg="#ff4444",
        bg="#1a1a1a",
    ).pack(pady=20)

    battery = psutil.sensors_battery()
    battery_text = f"{battery.percent:.0f}%" if battery else "Unknown"
    tk.Label(
        frame,
        text=f"Battery: {battery_text}",
        font=("Arial", 16),
        fg="white",
        bg="#1a1a1a",
    ).pack(pady=10)

    tk.Label(
        frame,
        text="Please connect charger",
        font=("Arial", 14),
        fg="#ccc",
        bg="#1a1a1a",
    ).pack(pady=10)

    tk.Button(
        frame,
        text="Proceed Anyway",
        command=root.destroy,
        font=("Arial", 12),
        bg="#444",
        fg="white",
        padx=20,
        pady=5,
    ).pack(pady=20)

    def monitor():
        if check_charger():
            root.destroy()
        else:
            root.after(1000, monitor)

    monitor()
    root.mainloop()


if __name__ == "__main__":
    main()
