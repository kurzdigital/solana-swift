import Foundation

public enum ComputeBudgetProgram: SolanaBasicProgram {
    // MARK: - Nested type

    public enum Index {
        static let requestUnits: UInt8 = 0
        static let requestHeapFrame: UInt8 = 1
        static let setComputeUnitLimit: UInt8 = 2
        static let setComputeUnitPrice: UInt8 = 3
    }

    /// The public id of the program
    public static var id: PublicKey {
        "ComputeBudget111111111111111111111111111111"
    }

    /// Create SetComputeUnitPrice instruction
    public static func createSetComputeUnitPriceInstruction(microLamports: UInt64) throws -> TransactionInstruction {
        TransactionInstruction(
            keys: [],
            programId: id,
            data: [Index.setComputeUnitPrice, microLamports]
        )
    }

    /// Create SetComputeUnitLimit instruction
    public static func createSetComputeUnitLimitInstruction(limit: UInt32) throws -> TransactionInstruction {
        TransactionInstruction(
            keys: [],
            programId: id,
            data: [Index.setComputeUnitLimit, limit]
        )
    }
}
