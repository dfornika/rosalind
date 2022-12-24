const std = @import("std");

const BaseCount = struct {
    a: u64,
    c: u64,
    g: u64,
    t: u64,
};

const INPUT_BUFFER_SIZE = 1024;



pub fn main() !void {

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var input_buffer: [INPUT_BUFFER_SIZE]u8 = undefined;

    var base_count = BaseCount {
        .a = 0,
        .c = 0,
        .g = 0,
        .t = 0,
    };

    var input = try stdin.readUntilDelimiterOrEof(&input_buffer, '\n');

    for (input.?[0..]) |base| {
        switch (base) {
            'A' => base_count.a += 1,
            'C' => base_count.c += 1,
            'G' => base_count.g += 1,
            'T' => base_count.t += 1,
            else => {},
        }
    }

    try stdout.print("{d} {d} {d} {d}\n", .{base_count.a, base_count.c, base_count.g, base_count.t});

}
