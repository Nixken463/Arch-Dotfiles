#!/bin/bash

enable_services() {
    echo "Enabling system services..."

    SYSTEM_SERVICES=(
        NetworkManager
        bluetooth
        sddm
    )

    USER_SERVICES=(
        syncthing
    )

    # Enable system services
    for svc in "${SYSTEM_SERVICES[@]}"; do
        sudo systemctl enable "$svc"
    done

    # Enable user services
    for svc in "${USER_SERVICES[@]}"; do
        systemctl --user enable "$svc"
    done

    echo "Services enabled!"
}
