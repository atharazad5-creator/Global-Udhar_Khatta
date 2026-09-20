<!DOCTYPE html>
<html lang="ur" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>گلوبل ڈیجیٹل کھاتہ اور آؤٹ لیٹ مینجمنٹ سسٹم</title>
    <style>
        :root {
            --primary-color: #004080;
            --secondary-color: #ff9900;
            --bg-color: #f4f7f6;
            --card-bg: #ffffff;
            --text-color: #333333;
            --border-color: #e0e0e0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            direction: rtl;
            text-align: right;
        }

        /* ہیڈر سیکشن */
        header {
            background-color: var(--primary-color);
            color: white;
            padding: 12px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo-section {
            display: flex;
            align-items: center;
            gap: 12px;
            cursor: pointer;
        }

        .logo-icon {
            background-color: var(--secondary-color);
            color: white;
            font-weight: bold;
            font-size: 20px;
            width: 42px;
            height: 42px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }

        .app-title {
            font-size: 20px;
            font-weight: bold;
            letter-spacing: 0.5px;
        }

        /* ہیڈر نیویگیشن مینو بٹنز */
        .header-nav {
            display: flex;
            gap: 10px;
        }

        .nav-btn {
            background-color: transparent;
            color: white;
            border: 1px solid rgba(255,255,255,0.4);
            padding: 6px 14px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
        }

        .nav-btn:hover, .nav-btn.active {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            font-weight: bold;
        }

        /* مین کنٹینر */
        .container {
            max-width: 700px;
            margin: 30px auto;
            background: var(--card-bg);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        h2 {
            color: var(--primary-color);
            margin-top: 0;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 10px;
        }

        /* فارم اور سرچ فیلڈز */
        .input-group {
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: var(--primary-color);
        }

        /* آؤٹ لیٹ لسٹ اسٹائل */
        .outlet-list {
            list-style: none;
            padding: 0;
            margin-top: 15px;
        }

        .outlet-item {
            background: #fafafa;
            border: 1px solid var(--border-color);
            padding: 14px 18px;
            margin-bottom: 10px;
            border-radius: 6px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: 0.2s;
        }

        .outlet-item:hover {
            background: #f0f4f8;
            border-color: #cbd5e1;
        }

        /* بٹنز اسٹائل */
        .btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: 0.2s;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-primary {
            background-color: var(--primary-color);
        }

        .btn-warning {
            background-color: var(--secondary-color);
            color: white;
        }

        .back-btn {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 15px;
            font-size: 13px;
        }

        /* سیکشنز کی نظر آنے یاپوشیدہ ہونے کی کلاسز */
        .section-view {
            display: none;
        }

        .active-section {
            display: block;
        }

        /* ڈ্যাশবোর্ড یا سمری کارڈز */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 20px;
        }

        .stat-card {
            background: #f8fafc;
            border: 1px solid var(--border-color);
            padding: 15px;
            border-radius: 8px;
            text-align: center;
        }

        .stat-card h3 {
            margin: 0;
            font-size: 14px;
            color: #64748b;
        }

        .stat-card p {
            font-size: 20px;
            font-weight: bold;
            color: var(--primary-color);
            margin: 8px 0 0 0;
        }

        .alert-box {
            background: #e2f0d9;
            border: 1px solid #c8e1b9;
            color: #274e13;
            padding: 10px 15px;
            border-radius: 5px;
            margin-bottom: 15px;
            display: none;
        }
    </style>
</head>
<body>

    <!-- ہیڈر سیکشن: لوگو اور مینو نیویگیشن -->
    <header>
        <div class="logo-section" onclick="switchSection('mainSection')">
            <div class="logo-icon">G</div>
            <span class="app-title">گلوبل ڈیجیٹل کھاتہ</span>
        </div>
        <div class="header-nav">
            <button class="nav-btn active" id="navOutlets" onclick="switchSection('mainSection')">مائی آؤٹ لیٹس</button>
            <button class="nav-btn" id="navAccount" onclick="switchSection('accountSection')">ڈیجیٹل کھاتہ</button>
            <button class="nav-btn" id="navReports" onclick="switchSection('reportsSection')">رپورٹس</button>
        </div>
    </header>

    <div class="container">
        
        <div id="alertBox" class="alert-box"></div>

        <!-- 1. مائی آؤٹ لیٹ اور سرچ سیکشن (ہوم پیج) -->
        <div id="mainSection" class="section-view active-section">
            <h2>مائی آؤٹ لیٹس (دکانیں)</h2>
            <p style="color: #666; font-size: 14px;">پیج کھلتے ہی آپ کے تمام محفوظ شدہ آؤٹ لیٹس یہاں آటో لوڈ ہو جاتے ہیں۔ سرچ بار میں نام لکھ کر فوری تلاش کریں۔</p>
            
            <div class="input-group" style="margin-top: 15px;">
                <input type="text" id="searchInput" class="form-control" placeholder="🔍 دکان کا نام تلاش کریں..." onkeyup="filterOutlets()">
            </div>
            
            <ul id="outletList" class="outlet-list">
                <!-- آؤٹ لیٹس JavaScript کے ذریعے خودکار لوڈ ہوں گے -->
            </ul>
        </div>

        <!-- 2. آرڈر پنچ کرنے کا سیکشن -->
        <div id="orderSection" class="section-view">
            <button class="back-btn" onclick="switchSection('mainSection')">← واپس آؤٹ لیٹس کی فہرست پر جائیں</button>
            <h2>آرڈر پنچ کریں</h2>
            <p>منتخب کردہ آؤٹ لیٹ: <span id="currentOutletName" style="font-weight: bold; color: var(--primary-color);"></span></p>
            
            <div class="input-group">
                <label>آئٹم کا نام / کیٹگری:</label>
                <input type="text" id="orderItemName" class="form-control" placeholder="مثلاً: پروڈکٹ کا نام لکھیں">
            </div>

            <div class="input-group">
                <label>مقدار (Quantity):</label>
                <input type="number" id="orderQuantity" class="form-control" placeholder="تعداد درج کریں">
            </div>

            <div class="input-group">
                <label>کل رقم (Rs):</label>
                <input type="number" id="orderAmount" class="form-control" placeholder="رقم درج کریں">
            </div>

            <button class="btn" onclick="submitOrder()">آرڈر سبمٹ / پنچ کریں</button>
        </div>

        <!-- 3. ڈیجیٹل کھاتہ سیکشن -->
        <div id="accountSection" class="section-view">
            <h2>گلوبل ڈیجیٹل کھاتہ (لیجر)</h2>
            <p>یہاں آپ اپنے لین دین، ادھار اور نقد رقم کا مکمل حساب رکھ سکتے ہیں۔</p>
            
            <div class="stats-grid">
                <div class="stat-card">
                    <h3>کل بقایاجات (Receivables)</h3>
                    <p id="totalReceivable">Rs. 12,500</p>
                </div>
                <div class="stat-card">
                    <h3>کل وصول شدہ</h3>
                    <p id="totalReceived" style="color: #28a745;">Rs. 45,000</p>
                </div>
            </div>

            <div style="background: #f8fafc; padding: 15px; border-radius: 8px; border: 1px solid var(--border-color);">
                <h3 style="margin-top: 0; font-size: 16px;">نیا لین دین درج کریں</h3>
                <div class="input-group">
                    <label>گاہک / آؤٹ لیٹ کا نام:</label>
                    <input type="text" id="ledgerParty" class="form-control" placeholder="نام درج کریں">
                </div>
                <div class="input-group">
                    <label>رقم (Rs):</label>
                    <input type="number" id="ledgerAmount" class="form-control" placeholder="رقم">
                </div>
                <button class="btn btn-primary" onclick="saveLedgerEntry()">کھاتہ محفوظ کریں</button>
            </div>
        </div>

        <!-- 4. رپورٹس سیکشن -->
        <div id="reportsSection" class="section-view">
            <h2>کارکردگی رپورٹس</h2>
            <p>یہاں آپ اپنے کل آرڈرز اور روزانہ کی سیلز کا جائزہ لے سکتے ہیں۔</p>
            <div class="stat-card" style="max-width: 300px; margin-top: 15px;">
                <h3>کل پنچ شدہ آرڈرز</h3>
                <p id="totalOrdersCount">0</p>
            </div>
        </div>

    </div>

<script>
    // ڈمی ڈیٹا: محفوظ شدہ آؤٹ لیٹس جو پیج کھلتے ہی خود بخود لوڈ ہوں گے
    let outlets = [
        { id: 1, name: "المدینہ جنرل سٹور، کراچی" },
        { id: 2, name: "البحرین سپر مارکیٹ" },
        { id: 3, name: "الفضل ٹریڈرز اینڈ جنرل سٹور" },
        { id: 4, name: "الرحیم کریانہ سٹور" },
        { id: 5, name: "نبی بخش اینڈ سنز" }
    ];

    let totalOrders = 0;

    // پیج لوڈ ہوتے ہی آؤٹ لیٹس کو آٹو شو کرنا
    window.onload = function() {
        displayOutlets(outlets);
    };

    // آؤٹ لیٹس کی فہرست سکرین پر دکھانے کا فنکشن
    function displayOutlets(outletArray) {
        const listElement = document.getElementById('outletList');
        listElement.innerHTML = '';

        if (outletArray.length === 0) {
            listElement.innerHTML = '<li style="text-align: center; color: #777; padding: 15px;">کوئی دکان یا آؤٹ لیٹ نہیں ملا</li>';
            return;
        }

        outletArray.forEach(outlet => {
            const li = document.createElement('li');
            li.className = 'outlet-item';
            li.innerHTML = `
                <span style="font-weight: 500;">${outlet.name}</span>
                <button class="btn" onclick="openOrderPage('${outlet.name}')">آرڈر پنچ کریں</button>
            `;
            listElement.appendChild(li);
        });
    }

    // سرچ بار کا فنکشن (جیسے ہی نام لکھیں گے، دکان سامنے آ جائے گی)
    function filterOutlets() {
        const query = document.getElementById('searchInput').value.toLowerCase();
        const filtered = outlets.filter(outlet => outlet.name.toLowerCase().includes(query));
        displayOutlets(filtered);
    }

    // مینو سکرینز کو آپس میں تبدیل کرنے کا فنکشن
    function switchSection(sectionId) {
        // تمام سیکشنز چھپائیں
        document.querySelectorAll('.section-view').forEach(sec => {
            sec.classList.remove('active-section');
        });

        // ہیڈر کے تمام نیو بٹنز سے ایکٹیভ کلاس ہٹائیں
        document.querySelectorAll('.header-nav .nav-btn').forEach(btn => {
            btn.classList.remove('active');
        });

        // مطلوبہ سیکشن ظاہر کریں
        document.getElementById(sectionId).classList.add('active-section');

        // متعلقہ نیو بٹن کو ایکٹیভ کریں
        if(sectionId === 'mainSection') {
            document.getElementById('navOutlets').classList.add('active');
            document.getElementById('searchInput').value = '';
            displayOutlets(outlets);
        } else if(sectionId === 'accountSection') {
            document.getElementById('navAccount').classList.add('active');
        } else if(sectionId === 'reportsSection') {
            document.getElementById('navReports').classList.add('active');
        }
    }

    // آرڈر پیج کھولنا
    function openOrderPage(outletName) {
        switchSection('orderSection');
        // بیک گراؤنڈ میں سیکشن سوئچ کرنے کے بعد سیکشن ویو کو فوراً آرڈر پر سیٹ کریں
        document.getElementById('mainSection').classList.remove('active-section');
        document.getElementById('orderSection').classList.add('active-section');
        
        document.getElementById('currentOutletName').innerText = outletName;
        document.getElementById('orderItemName').value = '';
        document.getElementById('orderQuantity').value = '';
        document.getElementById('orderAmount').value = '';
    }

    // آرڈر پنچ سبمٹ کرنے کا عمل
    function submitOrder() {
        const item = document.getElementById('orderItemName').value;
        const qty = document.getElementById('orderQuantity').value;
        const outlet = document.getElementById('currentOutletName').innerText;

        if(item.trim() === "" || qty.trim() === "") {
            showAlert("براہ کرم آئٹم کا نام اور مقدار لازمی درج کریں!", "error");
            return;
        }

        totalOrders++;
        document.getElementById('totalOrdersCount').innerText = totalOrders;
        
        showAlert(`کامیابی! "${outlet}" کے لیے آرڈر کامیابی سے پنچ کر دیا گیا ہے۔`, "success");
        switchSection('mainSection');
    }

    // کھاتہ محفوظ کرنے کا عمل
    function saveLedgerEntry() {
        const party = document.getElementById('ledgerParty').value;
        const amount = document.getElementById('ledgerAmount').value;

        if(party.trim() === "" || amount.trim() === "") {
            showAlert("براہ کرم تمام معلومات درج کریں!", "error");
            return;
        }

        showAlert("ڈیجیٹل کھاتہ کامیابی سے اپ ڈیٹ ہو گیا ہے!", "success");
        document.getElementById('ledgerParty').value = '';
        document.getElementById('ledgerAmount').value = '';
    }

    // الرట్ میسج دکھانے کا فنکشن
    function showAlert(message, type) {
        const alertBox = document.getElementById('alertBox');
        alertBox.innerText = message;
        if(type === "error") {
            alertBox.style.background = "#f8d7da";
            alertBox.style.color = "#721c24";
            alertBox.style.borderColor = "#f5c6cb";
        } else {
            alertBox.style.background = "#e2f0d9";
            alertBox.style.color = "#274e13";
            alertBox.style.borderColor = "#c8e1b9";
        }
        alertBox.style.display = "block";
        setTimeout(() => {
            alertBox.style.display = "none";
        }, 4000);
    }
</script>

</body>
</html>
