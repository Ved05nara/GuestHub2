#!/bin/bash

echo "=========================================="
echo "📋 Backend API Testing Examples"
echo "=========================================="
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

API_URL="http://localhost:8001/api"

echo -e "${YELLOW}Copy and paste any of these commands to test:${NC}"
echo ""

echo -e "${BLUE}1. Register a User${NC}"
echo "curl -X POST $API_URL/auth/register \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{"
echo "    \"email\": \"test@example.com\","
echo "    \"password\": \"password123\","
echo "    \"name\": \"Test User\","
echo "    \"role\": \"guest\""
echo "  }'"
echo ""

echo -e "${BLUE}2. Login${NC}"
echo "curl -X POST $API_URL/auth/login \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{"
echo "    \"email\": \"test@example.com\","
echo "    \"password\": \"password123\""
echo "  }'"
echo ""

echo -e "${BLUE}3. Get All Rooms (No Auth Required)${NC}"
echo "curl $API_URL/rooms"
echo ""

echo -e "${BLUE}4. Create a Booking (No Auth Required)${NC}"
echo "curl -X POST $API_URL/bookings \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -d '{"
echo "    \"fullName\": \"John Doe\","
echo "    \"email\": \"john@example.com\","
echo "    \"phone\": \"1234567890\","
echo "    \"roomType\": \"deluxe\","
echo "    \"checkInDate\": \"2025-12-01\","
echo "    \"checkOutDate\": \"2025-12-05\","
echo "    \"numberOfGuests\": 2,"
echo "    \"specialRequests\": \"Late checkout\","
echo "    \"totalPrice\": 7996.0"
echo "  }'"
echo ""

echo -e "${BLUE}5. Create a Room (Requires Admin Token)${NC}"
echo "# First get token from login, then:"
echo "TOKEN=\"YOUR_TOKEN_HERE\""
echo ""
echo "curl -X POST $API_URL/rooms \\"
echo "  -H 'Content-Type: application/json' \\"
echo "  -H 'Authorization: Bearer \$TOKEN' \\"
echo "  -d '{"
echo "    \"number\": \"101\","
echo "    \"type\": \"deluxe\","
echo "    \"pricePerNight\": 1999.0,"
echo "    \"capacity\": 2,"
echo "    \"status\": \"AVAILABLE\""
echo "  }'"
echo ""

echo -e "${BLUE}6. Get All Bookings (Requires Auth)${NC}"
echo "TOKEN=\"YOUR_TOKEN_HERE\""
echo ""
echo "curl $API_URL/bookings \\"
echo "  -H 'Authorization: Bearer \$TOKEN'"
echo ""

echo "=========================================="
echo -e "${GREEN}✅ Run any command above to test!${NC}"
echo "=========================================="
