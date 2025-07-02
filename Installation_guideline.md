# Installation Guidelines 🛠️

This document provides clear instructions to install and set up the **Airbnb Data Mart** using MySQL Workbench.

---

## A. Requirements

✅ **MySQL Workbench** must be installed.

🔗 Download from the official MySQL website:  
https://dev.mysql.com/downloads/workbench/

---

## B. Getting Your Database Connected

1. Launch **MySQL Workbench**.
2. In the **MySQL Connections** section, click the **“+”** to add a new connection.
3. Enter:
   - **Connection Name**: e.g. `Airbnb Data Mart`
   - **Hostname**: `localhost`
   - **Username**: `root` (or your MySQL username)
   - **Password**: your MySQL root password
4. Test the connection and save it by clicking **OK**.

---

## C. Installing and Setting Up the Project

1. Clone this repository or download it as a ZIP:

```bash
git clone https://github.com/your-username/airbnb-datamart-mysql.git
```

2. Open the `improved_airbnb_datamart.sql` file in **MySQL Workbench**:
   - `File > Open SQL Script...`

3. Connect to your database, then run the script (⚡ icon or `Ctrl+Shift+Enter`) to create all tables.

4. Refresh the **SCHEMAS** tab. You should see:
   ```
   datamart_airbnb
   ```

---

## D. Verifying Your Setup

1. Expand `datamart_airbnb > Tables`
2. Try a test query:

```sql
SELECT * FROM users;
```

3. You can now use this data mart for analysis, extensions, or dashboarding.

---

## E. Project Structure

```
📁 airbnb-datamart-mysql
├── improved_airbnb_datamart.sql   # Full schema
└── README.md                      # Setup instructions
```

---


Made with ❤️ by BlueAy
