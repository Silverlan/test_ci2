local test = "Hello"
print("Test Message: ", test)
print(engine.load_library("mount_external/pr_mount_external"))
--print(\"Import: \",asset.import(\"headcrabclassic\", asset.TYPE_MODEL))
game.load_model("headcrabclassic")

local cb = game.add_callback("Think", function()
	test.complete()
	--engine.shutdown()
end)

return false, "This is a test error"
