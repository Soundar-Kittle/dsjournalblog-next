"use client";

import { useState } from "react";

export default function MultiSelectInput({
    label,
    name,
    items = [],
    placeholder = "Add new item...",
    allowCustom = true,
}) {
    const [selectedIds, setSelectedIds] = useState(new Set());
    const [customItems, setCustomItems] = useState([]);
    const [inputValue, setInputValue] = useState("");

    const handleCheckboxChange = (id) => {
        const newSelected = new Set(selectedIds);
        if (newSelected.has(id)) {
            newSelected.delete(id);
        } else {
            newSelected.add(id);
        }
        setSelectedIds(newSelected);
    };

    const handleAddCustom = (e) => {
        e.preventDefault();
        if (inputValue.trim()) {
            const newItem = {
                id: `custom-${Date.now()}`,
                name: inputValue.trim(),
                isCustom: true,
            };
            setCustomItems([...customItems, newItem]);
            setSelectedIds(new Set([...selectedIds, newItem.id]));
            setInputValue("");
        }
    };

    const handleRemoveCustom = (id) => {
        setCustomItems(customItems.filter((item) => item.id !== id));
        const newSelected = new Set(selectedIds);
        newSelected.delete(id);
        setSelectedIds(newSelected);
    };

    const allItems = [...items, ...customItems];

    return (
        <div>
            <label className="block font-medium mb-2">{label}</label>

            {/* Selected Items Display */}
            {selectedIds.size > 0 && (
                <div className="flex flex-wrap gap-2 mb-3">
                    {allItems
                        .filter((item) => selectedIds.has(item.id))
                        .map((item) => (
                            <span
                                key={item.id}
                                className="inline-flex items-center gap-1 px-3 py-1 bg-black text-white text-sm rounded-full"
                            >
                                {item.name}
                                <button
                                    type="button"
                                    onClick={() => handleCheckboxChange(item.id)}
                                    className="ml-1 hover:text-gray-300"
                                >
                                    ×
                                </button>
                            </span>
                        ))}
                </div>
            )}

            {/* Existing Items List */}
            <div className="border rounded p-3 space-y-2 max-h-48 overflow-y-auto mb-3">
                {items.map((item) => (
                    <label
                        key={item.id}
                        className="flex items-center gap-2 text-sm cursor-pointer hover:bg-gray-50 p-1 rounded"
                    >
                        <input
                            type="checkbox"
                            checked={selectedIds.has(item.id)}
                            onChange={() => handleCheckboxChange(item.id)}
                            className="accent-black"
                        />
                        {item.name}
                    </label>
                ))}
                {items.length === 0 && (
                    <p className="text-sm text-gray-500">No items available</p>
                )}
            </div>

            {/* Add Custom Item */}
            {allowCustom && (
                <div className="flex gap-2">
                    <input
                        type="text"
                        value={inputValue}
                        onChange={(e) => setInputValue(e.target.value)}
                        onKeyDown={(e) => {
                            if (e.key === "Enter") {
                                handleAddCustom(e);
                            }
                        }}
                        placeholder={placeholder}
                        className="flex-1 border rounded px-3 py-2 text-sm"
                    />
                    <button
                        type="button"
                        onClick={handleAddCustom}
                        className="px-4 py-2 bg-gray-800 text-white rounded text-sm hover:bg-gray-700"
                    >
                        Add
                    </button>
                </div>
            )}

            {/* Custom Items Display */}
            {customItems.length > 0 && (
                <div className="mt-3 p-2 bg-gray-50 rounded">
                    <p className="text-xs text-gray-600 mb-2">New items to be created:</p>
                    <div className="flex flex-wrap gap-2">
                        {customItems.map((item) => (
                            <span
                                key={item.id}
                                className="inline-flex items-center gap-1 px-2 py-1 bg-blue-100 text-blue-800 text-xs rounded"
                            >
                                {item.name}
                                <button
                                    type="button"
                                    onClick={() => handleRemoveCustom(item.id)}
                                    className="ml-1 hover:text-blue-600"
                                >
                                    ×
                                </button>
                            </span>
                        ))}
                    </div>
                </div>
            )}

            {/* Hidden inputs for form submission */}
            {allItems
                .filter((item) => selectedIds.has(item.id))
                .map((item) => (
                    <input
                        key={item.id}
                        type="hidden"
                        name={item.isCustom ? `${name}New` : name}
                        value={item.isCustom ? item.name : item.id}
                    />
                ))}
        </div>
    );
}
