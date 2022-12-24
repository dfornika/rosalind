const std = @import("std");

const INPUT_BUFFER_SIZE = 1024;

pub fn main() !void {

    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var input_buffer: [INPUT_BUFFER_SIZE]u8 = undefined;

    var input = try stdin.readUntilDelimiterOrEof(&input_buffer, '\n');

    for (input.?[0..]) |base| {
        switch (base) {
            'T' => try stdout.print("{c}", .{'U'}),
            else => try stdout.print("{c}", .{base}),
        }
    }

    try stdout.print("\n", .{});

}
