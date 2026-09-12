# Shared Folder Configuration

## Objective

Configure a shared `/downloads` directory between the Ubuntu host and Kali Linux VM.

This allows files to be transferred conveniently between the host and the controlled cybersecurity laboratory.

---

## Host Configuration

Create the directory on the host:

```bash
mkdir -p ~/downloads
```

Verify:

```bash
ls -ld ~/downloads
```

---

## VirtualBox Configuration

Open:

```text
Kali Linux
→ Settings
→ Shared Folders
```

Add a new shared folder.

Configure:

```text
Folder Path:
~/downloads

Folder Name:
downloads

Auto-mount:
Enabled

Make Permanent:
Enabled
```

Save the configuration.

---

## Kali Linux

After starting Kali, check:

```bash
ls /media/
```

The shared folder may appear as:

```text
/media/sf_downloads
```

Check its contents:

```bash
ls -la /media/sf_downloads
```

---

## Permissions

If access is denied:

```bash
sudo usermod -aG vboxsf $USER
```

Restart Kali:

```bash
sudo reboot
```

After logging back in:

```bash
groups
```

Confirm:

```text
vboxsf
```

is listed.

---

## Test the Shared Folder

Create a test file inside Kali:

```bash
echo "Ethical Hacking Lab" > /media/sf_downloads/test.txt
```

On the host, verify:

```bash
ls ~/downloads
```

Expected:

```text
test.txt
```

Read the file:

```bash
cat ~/downloads/test.txt
```

Expected output:

```text
Ethical Hacking Lab
```

---

## Security Considerations

The shared folder should only contain files appropriate for the lab.

Do not place:

* Passwords
* Private keys
* API credentials
* Personal documents
* Production data
* Other sensitive information

inside the shared directory.

For this project, the shared directory should be treated as a controlled lab-transfer location.
