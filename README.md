# 🔭 SeeStar Cleanup Script

A lightweight PowerShell utility for cleaning up **SeeStar** working folders by removing unnecessary temporary and preview JPG files generated during imaging sessions.
It helps reclaim storage space while keeping your important imaging data untouched.
In real-world testing, the script reclaimed approximately **16–17%** of used storage, removing about **1.24 GB** of unnecessary files from a **7.38 GB** SeeStar dataset.

---
## ✨ What it removes
📂 Inside `*_sub` folders
Removes:
- All `.jpg` files

📂 Inside all other folders
Removes:
- Files matching `*_thn.jpg`

---
This safely removes generated preview thumbnails and auxiliary JPG files without affecting:
- FITS files
- Stacked outputs
- Other project data

---
## 🚀 How to Use

1. Download or copy the script file —  
   `SeeStar_AstroStat_4.0_Deluxe.ps1`
2. Place it inside your **MyWork** folder (or wherever you store all your star captures).
3. Right-click the file → **“Run with PowerShell.”**

---
## 🚀 Features
🔍 Automatic folder scanning
Scans all folders in the current directory automatically.
No manual browsing required.

---
♻️ Safe deletion (Recycle Bin support)
When run from a local Windows drive, files are moved to the **Recycle Bin**, allowing recovery if needed.

---
🎨 Color-coded console output for better readability:
- 🟡 **Yellow** — folder names
- 🟢 **Green** — deleted JPG count from `*_sub`
- 🔴 **Red** — deleted thumbnail count
- 🔵 **Cyan** — total freed disk space

---
📊 Cleanup statistics
Displays:
- Total freed disk space (MB)
- Total deleted JPG files from `*_sub`
- Total deleted `*_thn.jpg` files

---
 📁 Folder-by-folder reporting
Each processed folder reports:
✅ Files deleted  
ℹ️ Number of deleted files  
⚪ No matching files found

---
## ⚠️ Important notice
If the script is executed **directly on a SeeStar telescope connected via USB**, specifically from the device’s **`MyWorks`** folder, deleted files may be removed **immediately and permanently**.
This happens because external device storage may not support Windows Recycle Bin operations.

---
##✅ Recommended workflow
1. Copy your imaging folders from the telescope to your PC
2. Run the cleanup script locally
3. Verify results
4. Empty Recycle Bin if desired

---
## 💡 Purpose
This script is designed to help keep SeeStar project folders clean, lightweight, and easier to manage — especially after multiple imaging sessions where preview JPGs can accumulate quickly.
