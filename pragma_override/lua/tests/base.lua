test = test or {}
test.impl = test.impl or {}
test.impl.callbackHandler = test.impl.callbackHandler or util.CallbackHandler()
test.add_event_listener = function(...)
	return test.impl.callbackHandler:AddCallback(...)
end
test.run = function(scriptName)
	test.impl.currentTest = scriptName
	test.impl.callbackHandler:CallCallbacks("OnTestStart", scriptName)
	local retVals = { include(scriptName) }
	if retVals[1] ~= nil then
		test.complete(retVals[1], retVals[2])
	end
end
test.complete = function(success, errMsg)
	if success == false then
		error("Test '" .. test.impl.currentTest .. "' failed: " .. tostring(errMsg))
	end

	test.impl.callbackHandler:CallCallbacks("OnTestComplete", success, errMsg)
end
