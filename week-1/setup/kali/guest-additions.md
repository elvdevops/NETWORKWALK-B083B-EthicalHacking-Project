# VirtualBox Guest Additions

## Objective

Configure the VirtualBox guest integration required for convenient interaction between the Ubuntu host and Kali Linux VM.

The features used by this project include:

* Shared folders
* Clipboard integration
* Drag-and-drop
* Improved VirtualBox guest integration

---

## Pre-built Kali Image

When using the official Kali Linux VirtualBox image, the required VirtualBox guest tools are generally already included.

Verify that VirtualBox guest services are available:

```bash
systemctl status vboxservice
```

If the service exists and is running, the guest integration is active.

---

## VirtualBox Settings

In the Kali VM settings, configure:

```text
General
→ Advanced
```

Set:

```text
Shared Clipboard:
Bidirectional

Drag'n'Drop:
Bidirectional
```

---

## Verify Shared Folder Support

After configuring a shared folder, check:

```bash
ls /media/
```

VirtualBox shared folders commonly appear under:

```text
/media/sf_VirtualBox
```

For example:

```text
/media/sf_downloads
```

---

## User Permissions

If the shared folder cannot be accessed, add the current user to the VirtualBox shared-folder group:

```bash
sudo usermod -aG vboxsf $USER
```

Then log out and back in, or reboot:

```bash
sudo reboot
```

Verify group membership:

```bash
groups
```

Look for:

```text
vboxsf
```

---

## Verification

Test clipboard functionality by copying text between the host and Kali VM.

Test drag-and-drop by transferring a harmless test file.

Test shared folders using:

```bash
ls -la /media/sf_downloads
```

All three functions should work before continuing with the lab.
