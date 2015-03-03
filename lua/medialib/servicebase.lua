local oop = medialib.load("oop")

local Service = oop.class("Service")

function Service:on(event, callback)
	self._events = {}
	self._events[event] = self._events[event] or {}
	self._events[event][callback] = true
end
function Service:emit(event, ...)
	for k,_ in pairs(self._events[event] or {}) do
		k(...)
	end
end

function Service:load(url) end
function Service:isValidUrl(url) end
function Service:query(url, callback) end

-- Load service types
medialib.load("service_html")
medialib.load("service_bass")

-- Load the actual service files
for _,file in medialib.folderIterator("services") do
	file:load()
end