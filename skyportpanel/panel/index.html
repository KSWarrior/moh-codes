#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Updating package list and installing dependencies...${NC}"
sudo apt update
sudo apt install -y curl software-properties-common git

echo -e "${GREEN}Installing Node.js 20.x...${NC}"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

echo -e "${GREEN}Cloning Skyport Panel from GitHub...${NC}"
git clone https://github.com/achul123/panel5.git

if [ ! -d "panel5" ]; then
    echo "❌ Failed to clone repository or folder missing!"
    exit 1
fi

cd panel5 || { echo "❌ Failed to enter panel5 directory"; exit 1; }

echo -e "${GREEN}Installing Node.js dependencies...${NC}"
npm install

echo -e "${GREEN}Seeding database...${NC}"
npm run seed

echo -e "${GREEN}Creating admin user...${NC}"
npm run createUser

echo -e "${GREEN}Installing PM2 process manager...${NC}"
sudo npm install -g pm2

echo -e "${GREEN}Starting Skyport Panel with PM2...${NC}"
pm2 start index.js --name ks-installer-skyport-panel
pm2 save

echo -e "${GREEN}✅ Skyport Panel installation complete!${NC}"

exit 0

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Oops! Access Blocked</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #ffafbd, #ffc3a0);
      height: 100vh;
      overflow: hidden;
      display: flex;
      justify-content: center;
      align-items: center;
      color: #333;
      font-size: 0px;
    }

    .container {
      text-align: center;
      animation: fadeIn 1s ease-in-out;
      background: rgba(255, 255, 255, 0.8);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
      max-width: 600px;
      margin: 20px;
    }

    .container h1 {
      font-size: 5rem;
      color: #ff4b5c;
      animation: bounce 1.2s ease-in-out infinite alternate;
    }

    .container p {
      font-size: 1.3rem;
      margin: 15px 0;
    }

    .container a {
      display: inline-block;
      margin-top: 25px;
      padding: 12px 30px;
      font-size: 1rem;
      background-color: #1e90ff;
      color: white;
      text-decoration: none;
      border-radius: 8px;
      transition: all 0.3s ease;
    }

    .container a:hover {
      background-color: #005fa3;
      transform: scale(1.05);
    }

    @keyframes bounce {
      0% { transform: translateY(0); }
      100% { transform: translateY(-10px); }
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    /* Floating animation elements */
    .bubble {
      position: absolute;
      background: rgba(255,255,255,0.3);
      border-radius: 50%;
      animation: float 6s infinite ease-in-out;
    }

    .bubble:nth-child(1) {
      width: 60px; height: 60px; left: 20%; top: 10%;
      animation-delay: 0s;
    }

    .bubble:nth-child(2) {
      width: 40px; height: 40px; right: 25%; bottom: 15%;
      animation-delay: 1s;
    }

    .bubble:nth-child(3) {
      width: 80px; height: 80px; left: 10%; bottom: 20%;
      animation-delay: 2s;
    }

    @keyframes float {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-20px); }
    }
  </style>
</head>
<body>

  <!-- Decorative Bubbles -->
  <div class="bubble"></div>
  <div class="bubble"></div>
  <div class="bubble"></div>

  <div class="container">
    <h1>Oops!</h1>
    <p>This section is restricted.<br> It's not good to try and access or view the source code from here.</p>
    <a href="/">← Go Back Home</a>
  </div>

</body>
</html>
