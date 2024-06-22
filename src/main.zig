const std = @import("std");

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    var sBuf:[100]u8 = undefined;
    const s1 = "image";
    const s2 = "jpg";
    var counter:i32 = 5;
    _ = &counter;
    const slsBuf = try std.fmt.bufPrint(&sBuf,"{s}_{:0>6}.{s}",.{s1,counter,s2});
    try stdout.print("\n {s}", .{slsBuf});
    for(0..5)|i|{
      try stdout.print("\n {}", .{i});
    }

    try bw.flush(); // don't forget to flush!
}
