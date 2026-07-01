import LLVMC

@frozen
public struct LLVMBuilder {
    
    @usableFromInline
    internal final class _Builder {
        
        @usableFromInline
        internal let rawBuilder: LLVMBuilderRef
        
        @usableFromInline
        internal let context: LLVMContext
        
        @inlinable
        internal init(in context: LLVMContext) {
            self.rawBuilder = LLVMCreateBuilderInContext(context._context.rawContext)
            self.context = context
        }
        
        @inlinable
        deinit {
            LLVMDisposeBuilder(rawBuilder)
        }
    }
    
    @usableFromInline
    internal let _builder: _Builder
    
    @inlinable
    public init(in context: LLVMContext) {
        self._builder = _Builder(in: context)
    }
}
