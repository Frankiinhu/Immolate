#include "lib/immolate.cl"

long filter(instance* inst) {
    int ante = 1;    

    // Percorre os 2 pacotes do Ante 1
    for (int i = 0; i < 2; i++) {
        pack _pack = pack_info(next_pack(inst, ante));

        // Verifica o tipo e a quantidade de escolhas
        if (_pack.type == Spectral_Pack && _pack.choices == 2) {
            item cards[5]; // Array com espaço suficiente para o pacote
            spectral_pack(cards, _pack.size, inst, ante);

            bool hasCryptid = false;
            bool hasDejaVu = false;

            // Inspeciona as cartas geradas neste pacote
            for (int j = 0; j < _pack.size; j++) {
                if (cards[j] == Cryptid) hasCryptid = true;
                if (cards[j] == Deja_Vu) hasDejaVu = true;

                if (hasCryptid && hasDejaVu) return 1;
            }
        }
    }

    return 0;
}