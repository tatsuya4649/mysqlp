
function test_const(){
	TESTNET="../TESTNET"
	VERSION_FILE="./VERSION"
	TESTNAME_FILE="./TESTNAME"

	if [ -f $TESTNET ]; then
		TESTNETNAME=$(cat $TESTNET)
	else
		echo "not found test net file..."
	fi

	if [ -f $VERSION_FILE ]; then
		VERSION=$(cat $VERSION_FILE)
	else
		echo "not found test version file..."
	fi

	if [ -f $TESTNAME_FILE ]; then
		TESTNAME=$(cat $TESTNAME_FILE)
	else
		echo "not found test name file..."
	fi
}

test_const
