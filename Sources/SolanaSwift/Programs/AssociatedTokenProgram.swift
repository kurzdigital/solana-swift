import Foundation

public enum AssociatedTokenProgram: SolanaBasicProgram {
    // MARK: - Nested type

    public enum Index {
        static let create: UInt8 = 0
        static let createIdempotent: UInt8 = 1
    }

    // MARK: - Properties

    public static var id: PublicKey {
        "ATokenGPvbdGVxr1b2hvZbsiqW5xWH25efTNsLJA8knL"
    }

    // MARK: - Instruction builder

    public static func createAssociatedTokenAccountInstruction(
        mint: PublicKey,
        owner: PublicKey,
        payer: PublicKey
    ) throws -> TransactionInstruction {
        TransactionInstruction(
            keys: [
                .init(publicKey: payer, isSigner: true, isWritable: true),
                try .init(
                    publicKey: PublicKey.associatedTokenAddress(
                        walletAddress: owner,
                        tokenMintAddress: mint
                    ),
                    isSigner: false,
                    isWritable: true
                ),
                .init(publicKey: owner, isSigner: false, isWritable: false),
                .init(publicKey: mint, isSigner: false, isWritable: false),
                .init(publicKey: SystemProgram.id, isSigner: false, isWritable: false),
                .init(publicKey: TokenProgram.id, isSigner: false, isWritable: false),
            ],
            programId: AssociatedTokenProgram.id,
            data: [Index.create]
        )
    }

    public static func createAssociatedTokenAccountIdempotentInstruction(
        mint: PublicKey,
        owner: PublicKey,
        payer: PublicKey
    ) throws -> TransactionInstruction {
        TransactionInstruction(
            keys: [
                .init(publicKey: payer, isSigner: true, isWritable: true),
                try .init(
                    publicKey: PublicKey.associatedTokenAddress(
                        walletAddress: owner,
                        tokenMintAddress: mint
                    ),
                    isSigner: false,
                    isWritable: true
                ),
                .init(publicKey: owner, isSigner: false, isWritable: false),
                .init(publicKey: mint, isSigner: false, isWritable: false),
                .init(publicKey: SystemProgram.id, isSigner: false, isWritable: false),
                .init(publicKey: TokenProgram.id, isSigner: false, isWritable: false),
            ],
            programId: AssociatedTokenProgram.id,
            data: [Index.createIdempotent]
        )
    }
}
